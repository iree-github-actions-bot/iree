// Copyright 2021 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef IREE_HAL_WEBGPU_PLATFORM_NATIVE_NATIVE_DRIVER_H_
#define IREE_HAL_WEBGPU_PLATFORM_NATIVE_NATIVE_DRIVER_H_

#include "iree/base/api.h"
#include "iree/hal/api.h"
#include "iree/hal/webgpu/api.h"
#include "iree/hal/webgpu/platform/webgpu.h"

#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus

iree_status_t iree_hal_webgpu_native_driver_create(
    iree_string_view_t identifier,
    const iree_hal_webgpu_driver_options_t* options,
    iree_allocator_t host_allocator, iree_hal_driver_t** out_driver);

#ifdef __cplusplus
}  // extern "C"
#endif  // __cplusplus

#endif  // IREE_HAL_WEBGPU_PLATFORM_NATIVE_NATIVE_DRIVER_H_
