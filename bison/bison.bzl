# Copyright 2018 the rules_bison authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

"""Bazel rules for GNU Bison."""

load(
    "//bison:providers.bzl",
    _BisonToolchainInfo = "BisonToolchainInfo",
)
load(
    "//bison:toolchain_type.bzl",
    _BISON_TOOLCHAIN_TYPE = "BISON_TOOLCHAIN_TYPE",
    _bison_toolchain = "bison_toolchain",
)
load(
    "//bison/rules:bison.bzl",
    _bison = "bison",
)
load(
    "//bison/rules:bison_cc_library.bzl",
    _bison_cc_library = "bison_cc_library",
)
load(
    "//bison/rules:bison_java_library.bzl",
    _bison_java_library = "bison_java_library",
)

BISON_TOOLCHAIN_TYPE = _BISON_TOOLCHAIN_TYPE
bison = _bison
bison_cc_library = _bison_cc_library
bison_java_library = _bison_java_library
bison_toolchain = _bison_toolchain
BisonToolchainInfo = _BisonToolchainInfo

# buildifier: disable=unnamed-macro
def bison_register_toolchain():
    """
    A helper function for Bison toolchain registration.
    """

    native.register_toolchains("@rules_bison//bison/toolchains:bison")
