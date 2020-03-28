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

# Cache will look for our files here. Anything we put in this directory will
# get copied to all subsequent jobs that ask for the SDK.
CACHE_PATH=.cache/swiftshader/
rm -rf $CACHE_PATH
mkdir -p $CACHE_PATH

# Where our cmake build will dump files.
BUILD_PATH=build-swiftshader
mkdir -p $BUILD_PATH

# Swiftshader will run git submodules update --init *in the wrong directory*.
# To prevent us from getting a tensorflow checkout, get what Swiftshader wants
# directly:
pushd third_party/swiftshader/
git submodule update --init \
    third_party/libbacktrace/src/
popd

# Configure to minimal Vulkan library.
. $PWD/build_tools/cmake/cross_cmake.sh \
    -G Ninja \
    -B $BUILD_PATH \
    -DSWIFTSHADER_BUILD_VULKAN=TRUE \
    -DSWIFTSHADER_BUILD_EGL=FALSE \
    -DSWIFTSHADER_BUILD_GLESv2=FALSE \
    -DSWIFTSHADER_BUILD_GLES_CM=FALSE \
    -DSWIFTSHADER_BUILD_SAMPLES=FALSE \
    -DSWIFTSHADER_BUILD_PVR=FALSE \
    -DSWIFTSHADER_BUILD_TESTS=FALSE \
    -DSWIFTSHADER_WARNINGS_AS_ERRORS=FALSE \
    -DSWIFTSHADER_ENABLE_ASTC=FALSE \
    third_party/swiftshader/

# Build the project, choosing just the vk_swiftshader target.
# Outputs if successful (nested under CMAKE_SYSTEM_NAME):
#   Linux:   build-swiftshader/Linux/libvk_swiftshader.so
#   MacOS:   build-swiftshader/Darwin/libvk_swiftshader.dylib
#   Windows: build-swiftshader/Windows/vk_swiftshader.dll
. $PWD/build_tools/cmake/cross_cmake.sh \
    --build $BUILD_PATH/ \
    -j 2 \
    --target vk_swiftshader

# The build output will contain the shared object and the ICD JSON file.
if [[ "$HOST_OS" == "windows" ]]; then
  mv $BUILD_PATH/Windows/*vk_swiftshader* $CACHE_PATH/
elif [[ "$HOST_OS" == "macos" ]]; then
  mv $BUILD_PATH/Darwin/*vk_swiftshader* $CACHE_PATH/
else
  mv $BUILD_PATH/Linux/*vk_swiftshader* $CACHE_PATH/
fi

ls -laR $CACHE_PATH/
