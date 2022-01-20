// Copyright 2021 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#include "iree/compiler/Codegen/Dialect/IREECodegenDialect.h"

#include "iree/compiler/Codegen/Dialect/IREECodegenDialect.cpp.inc"
#include "iree/compiler/Codegen/Dialect/LoweringConfig.h"
#include "mlir/IR/DialectImplementation.h"

namespace mlir {
namespace iree_compiler {
namespace IREE {
namespace Codegen {

struct IREECodegenDialectOpAsmInterface : public OpAsmDialectInterface {
  using OpAsmDialectInterface::OpAsmDialectInterface;
  AliasResult getAlias(Attribute attr, raw_ostream &os) const override {
    if (attr.isa<TranslationInfoAttr>()) {
      os << "translation";
      return AliasResult::OverridableAlias;
    } else if (attr.isa<CompilationInfoAttr>()) {
      os << "compilation";
      return AliasResult::OverridableAlias;
    } else if (attr.isa<LoweringConfigAttr>()) {
      os << "config";
      return AliasResult::OverridableAlias;
    }
    return AliasResult::NoAlias;
  }
};

void IREECodegenDialect::initialize() {
  initializeCodegenAttrs();
  addInterfaces<IREECodegenDialectOpAsmInterface>();
}

}  // namespace Codegen
}  // namespace IREE
}  // namespace iree_compiler
}  // namespace mlir
