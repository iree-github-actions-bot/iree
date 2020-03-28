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
CACHE_PATH=.cache/compiler/
rm -rf $CACHE_PATH
mkdir -p $CACHE_PATH

BUILD_PATH=iree-build/
mkdir -p $BUILD_PATH

# TODO(GH-1156): pull in .cache/llvm-host/ and configure.

./build_tools/cmake/cross_cmake.sh \
    -DIREE_BUILD_COMPILER=ON \
    -DIREE_BUILD_TESTS=ON \
    -DIREE_BUILD_SAMPLES=OFF \
    -DIREE_BUILD_DEBUGGER=OFF \
    -DIREE_BUILD_PYTHON_BINDINGS=ON \
    -H. \
    -B $BUILD_PATH/ \
    -G Ninja \
    ..

. $PWD/build_tools/cmake/cross_cmake.sh \
    --build $BUILD_PATH/ \
    -j 2 \
    -- \
    iree_hal_vulkan_dynamic_symbols_test
    #all
    # iree_modules_check_iree-check-module \
    # iree_tools_iree-benchmark-module \
    # iree_tools_iree-dump-module \
    # iree_tools_iree-opt \
    # iree_tools_iree-run-mlir \
    # iree_tools_iree-run-module \
    # iree_tools_iree-tblgen \
    # iree_tools_iree-translate

# TODO(GH-1156): use install to setup $CACHE_PATH for caching.

ls -laR $CACHE_PATH/
