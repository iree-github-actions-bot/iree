#!/bin/bash

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e o pipefail

# Check that we're in the project root so our relative paths work as expected.
if [[ $(basename "$PWD") != "iree" ]]; then
  >&2 echo "******************************************************"
  >&2 echo "* This script should be run from IREE's project root *"
  >&2 echo "******************************************************"
  exit 1
fi

# This script will fetch the Vulkan SDK installer package and extract only the
# files we want. This is because the SDK itself is slow to download and also
# contains a tremendous amount of junk (samples, debug symbols, compilers, etc).
# To speed up our test time we just get the files required to use Swiftshader
# and the validation layers and ignore the rest. We also normalize the paths
# as the various platform SDKs have completely different directory structures
# and keeping things consistent makes the environment variables we need to setup
# cleaner.

# Cache will look for our files here. Anything we put in this directory will
# get copied to all subsequent jobs that ask for the SDK.
CACHE_PATH=.cache/vulkan-sdk-$HOST_OS/
rm -rf $CACHE_PATH
mkdir -p $CACHE_PATH
mkdir -p $CACHE_PATH/bin/
mkdir -p $CACHE_PATH/etc/vulkan/
mkdir -p $CACHE_PATH/lib/

# Our temporary working path for the SDK and runtime.
SDK_PATH=vulkan-sdk-$HOST_OS-full
mkdir -p $SDK_PATH
RT_PATH=vulkan-rt-$HOST_OS-full
mkdir -p $RT_PATH

# Windows:
# https://sdk.lunarg.com/sdk/download/latest/windows/vulkan-sdk.exe
#
# Files we want:
#   Bin/
#     VkLayer_device_simulation.*
#     VkLayer_khronos_validation.*
#     VkLayer_standard_validation.*
#     vulkaninfoSDK.exe
#   Config/**
#
# Unfortunately the actual vulkan loader is in the runtime components so we
# also need to fetch that.
if [[ "$HOST_OS" == "windows" ]]; then
  curl -SL \
    https://sdk.lunarg.com/sdk/download/latest/windows/vulkan-sdk.exe \
    -o vulkan-sdk.exe
  # NOTE: this may fail to extract some files, but we don't care about those.
  7z x vulkan-sdk.exe -o$SDK_PATH || true
  rm vulkan-sdk.exe
  # TODO(benvanik): copy layer json to /etc/vulkan/?
  mv $SDK_PATH/Bin/VkLayer_device_simulation.* $CACHE_PATH/lib/
  mv $SDK_PATH/Bin/VkLayer_khronos_validation.* $CACHE_PATH/lib/
  curl -SL \
    https://sdk.lunarg.com/sdk/download/latest/windows/vulkan-runtime-components.zip \
    -o vulkan-runtime-components.zip
  7z x vulkan-runtime-components.zip -o$RT_PATH
  f=("$RT_PATH"/*) && mv "$RT_PATH"/*/* "$RT_PATH" && rmdir "${f[@]}"
  mv $RT_PATH/x64/vulkaninfo.exe $CACHE_PATH/bin/
  mv $RT_PATH/x64/vulkan-1.* $CACHE_PATH/lib/
fi

# Linux:
# https://sdk.lunarg.com/sdk/download/latest/linux/vulkan-sdk.tar.gz
#
# Files we want:
#   1.2.131.2/
#     setup-env.sh
#     x86_64/
#       bin/
#         vulkaninfo
#       etc/**
#       lib/
#         libVkLayer_device_simulation.so
#         libVkLayer_khronos_validation.so
#         libvulkan*
if [[ "$HOST_OS" == "ubuntu" ]]; then
  curl -SL \
    https://sdk.lunarg.com/sdk/download/latest/linux/vulkan-sdk.tar.gz \
  | tar -zxf - -C $SDK_PATH --strip-components=1
  mv $SDK_PATH/x86_64/bin/vulkaninfo $CACHE_PATH/bin/
  mv $SDK_PATH/x86_64/etc/vulkan/explicit_layer.d $CACHE_PATH/etc/vulkan/
  mv $SDK_PATH/x86_64/lib/libVkLayer_device_simulation.* $CACHE_PATH/lib/
  mv $SDK_PATH/x86_64/lib/libVkLayer_khronos_validation.* $CACHE_PATH/lib/
  mv $SDK_PATH/x86_64/lib/libvulkan* $CACHE_PATH/lib/
fi

# MacOS:
# https://sdk.lunarg.com/sdk/download/latest/mac/vulkan-sdk.tar.gz
#
# Files we want:
#   vulkansdk-macos-1.2.131.2/
#     macOS/
#       bin/
#         vulkaninfo
#       etc/vulkan/explicit_layer.d/*
#       lib/
#         libVkLayer_khronos_validation.dylib
#         libvulkan*
if [[ "$HOST_OS" == "macos" ]]; then
  curl -SL \
    https://sdk.lunarg.com/sdk/download/latest/mac/vulkan-sdk.tar.gz \
  | tar -zxf - -C $SDK_PATH --strip-components=1
  mv $SDK_PATH/macOS/bin/vulkaninfo $CACHE_PATH/bin/
  mv $SDK_PATH/macOS/share/vulkan/explicit_layer.d $CACHE_PATH/etc/vulkan/
  mv $SDK_PATH/macOS/lib/libVkLayer_khronos_validation.* $CACHE_PATH/lib/
  mv $SDK_PATH/macOS/lib/libvulkan* $CACHE_PATH/lib/
fi

rm -rf $SDK_PATH
rm -rf $RT_PATH
ls -laR $CACHE_PATH/
