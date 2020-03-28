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

# TODO(GH-1156): build LLVM.
# build llvm targets
# mkdir cache/llvm/
# copy libs and bins
echo "llvm $HOST_OS $HOST_TOOLCHAIN $HOST_CONFIG"

# TODO(GH-1156): which cmake files to get caching?
# TODO(GH-1156): which targets? maybe build IREE opt/translate/etc and then
# just pick up what we want?

# cmake --no-warn-unused-cli -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE -DCMAKE_BUILD_TYPE:STRING=Debug -Hd:/Dev/iree -Bd:/Dev/iree-build -G Ninja
# ninja -C ../iree-build/ iree_tools_iree-opt
# -DCMAKE_BUILD_TYPE_INIT=Release

# TODO(GH-1156): install into $CACHE_PATH
