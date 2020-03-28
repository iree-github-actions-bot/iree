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

BUILD_PATH=iree-build/

# Tests to exclude by label. In addition to any custom labels (which are carried
# over from Bazel tags), every test should be labeled with the directory it is
# in.
declare -a label_exclude_args=(
  # Exclude specific labels.
  # Put the whole label with anchors for exact matches.
  # For example:
  #   ^driver=vulkan$
  ^nokokoro$

  # TODO(b/151445957) Enable the python tests when the Kokoro VMs support them.
  # See also, https://github.com/google/iree/issues/1346.
  # Exclude all tests in a directory.
  # Put the whole directory with anchors for exact matches.
  # For example:
  #   ^bindings/python/pyiree/rt$
  ^bindings$
  # Exclude all tests in some subdirectories.
  # Put the whole parent directory with only a starting anchor.
  # Use a trailing slash to avoid prefix collisions.
  # For example:
  #   ^bindings/
  ^bindings/
)
# Join on "|".
label_exclude_regex="($(IFS="|" ; echo "${label_exclude_args[*]?}"))"

if [[ "$HOST_OS" == "windows" ]]; then
  # TODO(benvanik): put up at the yml level.
  export PATH=$PATH:$GITHUB_WORKSPACE/.cache/swiftshader/:$GITHUB_WORKSPACE/.cache/vulkan-sdk/lib/
  export VK_ICD_FILENAMES=$GITHUB_WORKSPACE\\.cache\\swiftshader\\vk_swiftshader_icd.json
else
  # TODO(benvanik): make a helper that sets this environment.
  export VULKAN_SDK_PATH=`pwd`/.cache/vulkan-sdk/
  export LD_LIBRARY_PATH=$VULKAN_SDK_PATH/lib/
  export VK_LAYER_PATH=$VULKAN_SDK_PATH/lib/

  # NOTE: ICDs are only searched for in these paths, ignoring LD_LIBRARY_PATH.
  mkdir -p $HOME/.local/share/vulkan/icd.d/
  cp $SWIFTSHADER_PATH/* $HOME/.local/share/vulkan/icd.d/
fi

echo $HOME
echo $PATH
echo $VK_ICD_FILENAMES
echo $LD_LIBRARY_PATH

export VK_LOADER_DEBUG=all
# DO NOT SUBMIT
export LD_DEBUG=all

cd $BUILD_PATH
# ctest \
#     --progress \
#     --output-on-failure \
#     --label-exclude "${label_exclude_regex?}" \
#     --output-log test.log
./iree/hal/vulkan/iree_hal_vulkan_dynamic_symbols_test
