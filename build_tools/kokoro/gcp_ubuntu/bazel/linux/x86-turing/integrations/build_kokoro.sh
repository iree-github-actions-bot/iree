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

# Build and test IREE's integrations within the gcr.io/iree-oss/bazel-nvidia
# image using Kokoro.

set -e
set -x

# Print the UTC time when set -x is on
export PS4='[$(date -u "+%T %Z")] '

# Kokoro checks out the repository here.
WORKDIR="${KOKORO_ARTIFACTS_DIR?}/github/iree"

# Mount the checked out repository, make that the working directory and run the
# tests in the bazel-tensorflow image.
docker run \
  --volume "${WORKDIR?}:${WORKDIR?}" \
  --workdir="${WORKDIR?}" \
  --rm \
  --env IREE_VULKAN_DISABLE=0 \
  --gpus all \
  gcr.io/iree-oss/bazel-nvidia@sha256:77866668ac679de65f5008c3c3df0e5dbf2944a431c88a8c1b6b2e8ab7f8c65d \
  build_tools/kokoro/gcp_ubuntu/bazel/linux/x86-turing/integrations/build.sh

# Kokoro will rsync this entire directory back to the executor orchestrating the
# build which takes forever and is totally useless.
sudo rm -rf "${KOKORO_ARTIFACTS_DIR?}"/*

# Print out artifacts dir contents after deleting them as a coherence check.
ls -1a "${KOKORO_ARTIFACTS_DIR?}/"
