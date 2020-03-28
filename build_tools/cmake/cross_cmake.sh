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
set -e
set -x

# Check that we're in the project root so our relative paths work as expected.
if [[ $(basename "$PWD") != "iree" ]]; then
  >&2 echo "******************************************************"
  >&2 echo "* This script should be run from IREE's project root *"
  >&2 echo "******************************************************"
  exit 1
fi

if [[ -z "$TARGET_OS" ]]; then
  TARGET_OS=$HOST_OS
fi
if [[ -z "$TARGET_CONFIG" ]]; then
  TARGET_CONFIG=$HOST_CONFIG
fi

echo "[[cross-compiling cmake shim]]"
echo "  host-os: $HOST_OS"
echo "  host-toolchain: $HOST_TOOLCHAIN"
echo "  host-config: $HOST_CONFIG"
echo "  target-os: $TARGET_OS"
echo "  target-arch: $TARGET_ARCH"
echo "  target-config: $TARGET_CONFIG"

CC=${CC:-clang}
CXX=${CXX:-clang++}

if [[ "$HOST_TOOLCHAIN" == "local" ]]; then
  if [[ "$HOST_OS" == "windows" ]]; then
    HOST_TOOLCHAIN=msvc
  fi
fi

CMAKE_PATH=cmake
HOST_ARCH=x64
HOST_FLAGS=
if [[ "$HOST_TOOLCHAIN" == "msvc" ]]; then
  CMAKE_PATH=$PWD/build_tools/cmake/cmake_msvc.bat
  if [[ "$HOST_ARCH" == "$TARGET_ARCH" ]] || [[ -z "$TARGET_ARCH" ]]; then
    MSVC_ARCH=${HOST_ARCH}
  else
    MSVC_ARCH=${HOST_ARCH}_${TARGET_ARCH}
  fi
  export MSVC_ARCH="$(sed s/x64/amd64/g<<<$MSVC_ARCH)"
  CC=cl
  CXX=cl
elif [[ "$HOST_TOOLCHAIN" == "clang" ]]; then
  CC=clang
  CXX=clang++
  "$CC" --version
  "$CXX" --version
elif [[ "$HOST_TOOLCHAIN" == "gcc" ]]; then
  CC=gcc
  CXX=g++
  "$CC" --version
  "$CXX" --version
else
  echo "Using CC ($CC) and CXX ($CXX) environment vars for the compiler"
  "$CC" --version
  "$CXX" --version
fi

TARGET_FLAGS=
if [[ "$TARGET_OS" == "android" ]]; then
  # https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-android
  echo "TODO: android"
elif [[ "$TARGET_OS" == "ios" ]]; then
  # https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-ios-tvos-or-watchos
  echo "TODO: ios"
fi

if [[ "$TARGET_CONFIG" == "opt" ]]; then
  CMAKE_BUILD_TYPE="Release"
elif [[ "$TARGET_CONFIG" == "dbg" ]]; then
  CMAKE_BUILD_TYPE="Debug"
else
  CMAKE_BUILD_TYPE="RelWithDebInfo"
fi

if [[ "$1" == "--build" ]]; then
  $CMAKE_PATH \
      $HOST_FLAGS \
      $TARGET_FLAGS \
      $@
else
  $CMAKE_PATH \
      $@ \
      --no-warn-unused-cli \
      -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
      -DCMAKE_C_COMPILER=$CC \
      -DCMAKE_CXX_COMPILER=$CXX \
      -DCMAKE_BUILD_TYPE:STRING=$CMAKE_BUILD_TYPE \
      $HOST_FLAGS \
      $TARGET_FLAGS
fi
