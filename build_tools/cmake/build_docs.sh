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

# Build the IREE documentation with CMake. Designed for CI, but can be run
# manually. This uses previously cached build results and does not clear the
# build directory.

set -x
set -e

ROOT_DIR=$(git rev-parse --show-toplevel)
BUILD_DIR=${BUILD_DIR:-"build-docs"}

CMAKE_BIN=${CMAKE_BIN:-$(which cmake)}

"$CMAKE_BIN" --version
ninja --version

cd ${ROOT_DIR?}
if [ -d ${BUILD_DIR} ]
then
  echo "Build directory already exists. Will use cached results there."
else
  echo "Build directory does not already exist. Creating a new one."
  mkdir ${BUILD_DIR}
fi
cd ${BUILD_DIR}

"$CMAKE_BIN" .. -DCMAKE_BUILD_TYPE=Release \
                -DIREE_BUILD_COMPILER=ON \
                -DIREE_BUILD_TESTS=ON \
                -DIREE_BUILD_SAMPLES=OFF \
                -DIREE_BUILD_DOCS=ON \
                -DIREE_BUILD_PYTHON_BINDINGS=OFF \
                -G Ninja
# Generate docs and also build iree-opt for generating more docs :)
ninja iree-doc iree_tools_iree-opt

cd ${ROOT_DIR}
mkdir -p ${BUILD_DIR}/doc/
# Copy docs in source tree over
cp README.md ${BUILD_DIR}/doc/index.md
cp -rf docs/* ${BUILD_DIR}/doc/
cp integrations/tensorflow/e2e/README.md \
  ${BUILD_DIR}/doc/developing_iree/tensorflow_integrations.md

# Update op_coverage.md
scripts/update_op_coverage.py ${BUILD_DIR}

# Generate IR conversion flow examples
build_one_example() {
  example=$1
  target=$2

  example_name=$(basename ${example%.mlir})
  filepath=${BUILD_DIR}/doc/ir_examples/${example_name}-${target}.md
  title="${example_name} on ${target}"

  echo -e "# ${title}\n" > ${filepath}

  preamble="
This is an IR conversion example auto-generated by running \`iree-opt\`
over [${example_name}](https://github.com/google/iree/tree/main/${example}).

### The command
"
  echo -e "${preamble}" >> ${filepath}
  echo -e -n '```shell' >> ${filepath}

  cmd="
iree-opt -iree-transformation-pipeline \\
  -iree-hal-target-backends=${target} \\
  --print-ir-after-all \\
  -mlir-disable-threading \\
  -mlir-elide-elementsattrs-if-larger=8 \\
  ${example}
"
  echo -e "${cmd}" >> ${filepath}
  echo -e '```' >> ${filepath}

  echo -e "### Input IR\n" >> ${filepath}
  echo -e '{% raw %}\n```' >> ${filepath}
  cat ${example} >> ${filepath}

  tmpfile=$(mktemp)
  ${BUILD_DIR}/iree/tools/iree-opt \
    -iree-transformation-pipeline \
    -iree-hal-target-backends=${target} \
    -print-ir-after-all \
    -mlir-disable-threading \
    -mlir-elide-elementsattrs-if-larger=8 \
    ${example} 1>/dev/null 2>${tmpfile}

  # Reformat the IR dump into markdown.
  #   * Add "###"" subheader sections for each IR snippet
  #   * Wrap each IR snippet in {% raw %} {% endraw %} to block jekyll from
  #     running liquid template replacement within the code blocks
  #
  # Before:
  #    // *** IR Dump After {PASS_NAME_A} ***
  #    module { foo }
  #
  #    // *** IR Dump After {PASS_NAME_B} ***
  #    module { bar }
  #
  # After:
  #    ### IR Dump After {PASS_NAME_A}
  #
  #    {% raw %}
  #    ```
  #    module { foo }
  #    ```
  #    {% endraw %}
  #
  #    ### IR Dump After {PASS_NAME_B}
  #
  #    {% raw %}
  #    ```
  #    module { bar }
  #    ```
  #    {% endraw %}

  # Turn pass comment into headers and insert raw/endraw liquid template tags
  sed 's!^// \*\*\* IR Dump After \(.*\) \*\*\*$!```\n{% endraw %}\n\n### IR Dump After \1\n\n{% raw %}\n```!' \
    ${tmpfile} >> ${filepath}
  # Remove extra empty lines
  sed -i '/^$/N;/^\n$/D' ${filepath}
  # TODO(scotttodd): Remove extra newlines between } and ``` at the end of IR blocks
  echo -e '```\n{% endraw %}' >> ${filepath}
}

mkdir -p ${BUILD_DIR}/doc/ir_examples

build_one_example iree/samples/ops/mhlo-dot.mlir dylib-llvm-aot
build_one_example iree/samples/ops/mhlo-dot.mlir vmla
build_one_example iree/samples/ops/mhlo-dot.mlir vulkan-spirv
build_one_example iree/samples/ops/dynamic-mhlo-dot.mlir vmla
