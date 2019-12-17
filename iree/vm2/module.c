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

#include "iree/vm2/module.h"

#include <stdatomic.h>
#include <string.h>

IREE_API_EXPORT iree_status_t IREE_API_CALL
iree_vm_module_init(iree_vm_module_t* module, void* self) {
  memset(module, 0, sizeof(iree_vm_module_t));
  module->self = self;
  atomic_store(&module->ref_count, 1);
  return IREE_STATUS_OK;
}

IREE_API_EXPORT iree_status_t IREE_API_CALL
iree_vm_module_retain(iree_vm_module_t* module) {
  if (!module) return IREE_STATUS_INVALID_ARGUMENT;
  atomic_fetch_add(&module->ref_count, 1);
  return IREE_STATUS_OK;
}

IREE_API_EXPORT iree_status_t IREE_API_CALL
iree_vm_module_release(iree_vm_module_t* module) {
  if (module) {
    if (atomic_fetch_sub(&module->ref_count, 1) == 1) {
      return module->destroy(module->self);
    }
  }
  return IREE_STATUS_OK;
}

IREE_API_EXPORT iree_string_view_t IREE_API_CALL
iree_vm_module_name(const iree_vm_module_t* module) {
  if (!module) {
    return iree_make_cstring_view("null");
  }
  return module->name(module->self);
}

IREE_API_EXPORT iree_status_t IREE_API_CALL iree_vm_module_lookup_function(
    const iree_vm_module_t* module, iree_vm_function_linkage_t linkage,
    iree_string_view_t name, iree_vm_function_t* out_function) {
  return module->lookup_function(module->self, linkage, name, out_function);
}
