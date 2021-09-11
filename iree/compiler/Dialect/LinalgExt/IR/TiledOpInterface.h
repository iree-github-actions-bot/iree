// Copyright 2021 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef IREE_COMPILER_DIALECT_LINALGEXT_IR_TILEDOPINTERFACE_H_
#define IREE_COMPILER_DIALECT_LINALGEXT_IR_TILEDOPINTERFACE_H_

#include "mlir/Dialect/Utils/StructuredOpsUtils.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/BuiltinTypes.h"
#include "mlir/IR/Operation.h"
#include "mlir/Interfaces/ViewLikeInterface.h"
#include "mlir/Support/LLVM.h"

/// Include the ODS generated interface header files.
#include "iree/compiler/Dialect/LinalgExt/IR/TiledOpInterface.h.inc"

namespace mlir {
namespace iree_compiler {
namespace linalg_ext {

/// Registers external models implemented for the `TiledOpInterface`.
void registerTiledOpInterfaceExternalModels(DialectRegistry &registry);

}  // namespace linalg_ext
}  // namespace iree_compiler
}  // namespace mlir

#endif  // IREE_COMPILER_DIALECT_LINALGEXT_IR_TILEDOPINTERFACE_H_
