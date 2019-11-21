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

#include "iree/compiler/Dialect/Flow/Transforms/Passes.h"

#include <memory>

#include "mlir/Pass/PassRegistry.h"
#include "mlir/Transforms/Passes.h"

namespace mlir {
namespace iree_compiler {
namespace IREE {
namespace Flow {

void buildFlowTransformPassPipeline(OpPassManager &passManager) {
  // Flatten tuples (like tuple<tensor<...>, tensor<...>>) so we can do
  // fine-grained tensor tracking.
  passManager.addPass(IREE::Flow::createFlattenTuplesInCFGPass());

  // Find reduction ops and create flow.reduction.regions. We do this prior to
  // performing dispatch region identification so that we can build as big of
  // fused reduction regions as possible. The remaining ops will be put into
  // dispatch regions.
  passManager.addPass(IREE::Flow::createIdentifyReductionRegionsPass());
  passManager.addNestedPass<FuncOp>(createCSEPass());

  // First perform module-level analysis that following passes will use to query
  // per-function dispatchability information. We run this first so that it only
  // needs to run once and will be cached for all of the following passes.
  // TODO(b/144784188): avoid this and instead rely on AnalysisManager cache.
  auto dispatchableFuncOps = std::make_shared<llvm::StringMap<FuncOp>>();
  passManager.addPass(
      IREE::Flow::createDispatchabilityAnalysisPass(dispatchableFuncOps));

  // Create all of the dispatch regions, CSE their workloads, and fold.
  passManager.addPass(IREE::Flow::createIdentifyDispatchRegionsPass());
  passManager.addNestedPass<FuncOp>(createCSEPass());
  passManager.addPass(IREE::Flow::createFoldCompatibleDispatchRegionsPass());

  // Note that as we are rematerializing things here it's critical we do not run
  // the canonicalizer/CSE between now and when we outline - otherwise it'll
  // undo all of our work!
  passManager.addPass(IREE::Flow::createRematerializeDispatchConstantsPass());

  // Outline the dispatch regions into their own functions. This separates the
  // sequencer functions performing dispatches from the dispatchees.
  passManager.addPass(
      IREE::Flow::createOutlineDispatchRegionsPass(dispatchableFuncOps));
  passManager.addPass(
      IREE::Flow::createOutlineReductionRegionsPass(dispatchableFuncOps));

  // Cleanup identity ops that clutter up the IR and canonicalize.
  passManager.addNestedPass<FuncOp>(createCanonicalizerPass());

  // Assign attributes and negotiate each executable's ABI signature.
  passManager.addPass(IREE::Flow::createAssignExecutableWorkloadsPass());

  // Form streams.
  passManager.addPass(IREE::Flow::createFormStreamsPass());

  // TODO(benvanik): run symbol DCE pass.
}

static PassPipelineRegistration<> transformPassPipeline(
    "iree-flow-transformation-pipeline",
    "Runs the full IREE flow dialect transformation pipeline",
    [](OpPassManager &passManager) {
      buildFlowTransformPassPipeline(passManager);
    });

}  // namespace Flow
}  // namespace IREE
}  // namespace iree_compiler
}  // namespace mlir
