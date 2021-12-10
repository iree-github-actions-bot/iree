// Copyright 2021 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef IREE_HAL_WEBGPU_SIMPLE_ALLOCATOR_H_
#define IREE_HAL_WEBGPU_SIMPLE_ALLOCATOR_H_

#include "iree/base/api.h"
#include "iree/hal/api.h"
#include "iree/hal/webgpu/platform/webgpu.h"

#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus

iree_status_t iree_hal_webgpu_simple_allocator_create(
    WGPUDevice device, iree_string_view_t identifier,
    iree_allocator_t host_allocator, iree_hal_allocator_t** out_allocator);

// TODO(benvanik): rework for injection when we have other allocators.
void iree_hal_webgpu_simple_allocator_free(iree_hal_allocator_t* allocator,
                                           iree_hal_memory_type_t memory_type,
                                           WGPUBuffer buffer_handle,
                                           iree_device_size_t allocation_size);

#ifdef __cplusplus
}  // extern "C"
#endif  // __cplusplus

#endif  // IREE_HAL_WEBGPU_SIMPLE_ALLOCATOR_H_
