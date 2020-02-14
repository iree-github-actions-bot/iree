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

#ifndef IREE_COMPILER_DIALECT_MODULES_TENSORLIST_IR_TENSORLIST_DIALECT_H_
#define IREE_COMPILER_DIALECT_MODULES_TENSORLIST_IR_TENSORLIST_DIALECT_H_

#include "iree/compiler/Dialect/IREE/IR/IREETypes.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"

namespace mlir {
namespace iree_compiler {
namespace IREE {
namespace TensorList {

class TensorListDialect : public Dialect {
 public:
  explicit TensorListDialect(MLIRContext *context);
  static StringRef getDialectNamespace() { return "tensorlist"; }

  Type parseType(DialectAsmParser &parser) const override;
  void printType(Type type, DialectAsmPrinter &p) const override;
};

}  // namespace TensorList
}  // namespace IREE
}  // namespace iree_compiler
}  // namespace mlir

#endif  // IREE_COMPILER_DIALECT_MODULES_TENSORLIST_IR_TENSORLIST_DIALECT_H_
