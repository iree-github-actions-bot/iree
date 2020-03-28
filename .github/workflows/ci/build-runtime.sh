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

# TODO(GH-1156): build runtime executables.
echo "build runtime $HOST_OS $HOST_TOOLCHAIN $HOST_CONFIG $TARGET_OS $TARGET_ARCH $TARGET_CONFIG"
