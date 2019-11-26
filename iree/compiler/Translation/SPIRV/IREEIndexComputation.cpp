// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//===- IREEIndexComputation.cpp --------------------------------*- C++//-*-===//
//
// Implementaiton of Index Propagation for IREE statements that are used in
// dispatch functions.
//
//===----------------------------------------------------------------------===//
#include "iree/compiler/Translation/SPIRV/IREEIndexComputation.h"

namespace mlir {
namespace iree_compiler {

//===----------------------------------------------------------------------===//
// IREELoadInputOp
//===----------------------------------------------------------------------===//

LogicalResult IREELoadIndexPropagation::propagateIndexMap(
    Operation *operation, AffineMap resultIndex,
    SmallVectorImpl<AffineMap> &operandIndices) const {
  operandIndices.push_back(resultIndex);
  return success();
}

//===----------------------------------------------------------------------===//
// IREEStoreOutputOp
//===----------------------------------------------------------------------===//

LogicalResult IREEStoreIndexPropagation::propagateIndexMap(
    Operation *operation) const {
  auto storeOp = cast<IREE::StoreOutputOp>(operation);
  auto src = storeOp.src();
  SmallVector<int64_t, 4> srcShape;
  int64_t srcNumElements = 0;
  Type srcType = src->getType();
  if (auto srcShapedType = srcType.dyn_cast<ShapedType>()) {
    if (!srcShapedType.hasStaticShape()) {
      return storeOp.emitError(
          "can only handle store with src being tensor of static shape");
    }
    srcShape.append(srcShapedType.getShape().begin(),
                    srcShapedType.getShape().end());
    srcNumElements = srcShapedType.getNumElements();
  } else if (srcType.isIntOrFloat()) {
    srcShape.push_back(1);
    srcNumElements = 1;
  } else {
    return storeOp.emitError("unhandled src type for iree.store operation");
  }

  SmallVector<int64_t, 3> launchSize;
  auto funcOp = operation->getParentOfType<FuncOp>();
  if (!funcOp) {
    return operation->emitError(
        "expected operation to be in dispatch function to get launch size");
  }
  if (failed(getLaunchSize(funcOp, launchSize))) {
    return failure();
  }

  // The launch dimensions are [x, y, z] co-ordinates. The reverse of this is
  // used to determine the location of the tensor element computed by a
  // workitem. The choice is failry arbitrary but is done to enable the common
  // case where consecutive workitems compute "logically" adjacent tensor
  // elements.
  Builder builder(storeOp.getContext());
  SmallVector<AffineExpr, 4> affineExprs;
  int64_t numElements = 1;
  for (size_t i = launchSize.size(); i > 0; --i) {
    // If launchSize along any dimension is 1, just use 0 for the index. This is
    // not just an optimization. If you have an output of type memref<f32> which
    // is lowered to !spv.ptr<!spv.struct<f32>, StorageBuffer> with launchSize
    // <1>, then spv.AccessChain requires the indices to be a constant.
    if (launchSize[i - 1] == 1) {
      affineExprs.push_back(builder.getAffineConstantExpr(0));
    } else {
      affineExprs.push_back(builder.getAffineDimExpr(i - 1));
    }
    numElements *= launchSize[i - 1];
  }
  auto launchMap =
      index_computation_attribute::getAffineMap(funcOp, affineExprs);

  // The stored tensor can be a reshape of the launch dimension. It still
  // retains the requirement that each workitem is computing a single element
  // of the stored tensor.
  AffineMap srcMap;
  SmallVector<int64_t, 3> revLaunchSize(reverse(launchSize));
  if (numElements != srcNumElements ||
      failed(getReshapeOperandMap(funcOp, builder, launchMap, revLaunchSize,
                                  srcShape, srcMap))) {
    return storeOp.emitError(
        "unable to map from launch id to element to compute within a "
        "workitem");
  }
  return index_computation_attribute::addNewIndexMapForValue(src, srcMap);
}
}  // namespace iree_compiler
}  // namespace mlir
