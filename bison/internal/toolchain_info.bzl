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

"""Bazel toolchain for GNU Bison."""

load("//bison:providers.bzl", "BisonToolchainInfo")

_M4_TOOLCHAIN_TYPE = "@rules_m4//m4:toolchain_type"

def _template_vars(toolchain):
    return platform_common.TemplateVariableInfo({
        "BISON": toolchain.bison_tool.executable.path,
    })

def _bison_toolchain_info(ctx):
    m4 = ctx.toolchains[_M4_TOOLCHAIN_TYPE].m4_toolchain
    bison_runfiles = ctx.attr.bison_tool[DefaultInfo].default_runfiles.files

    bison_env = dict(m4.m4_env)
    if "M4" not in bison_env:
        bison_env["M4"] = "{}.runfiles/{}/{}".format(
            ctx.executable.bison_tool.path,
            ctx.executable.bison_tool.owner.workspace_name,
            m4.m4_tool.executable.short_path,
        )

    bison_env["BISON_PKGDATADIR"] = "{}.runfiles/{}/data".format(
        ctx.executable.bison_tool.path,
        ctx.executable.bison_tool.owner.workspace_name,
    )
    bison_env.update(ctx.attr.bison_env)

    toolchain = BisonToolchainInfo(
        all_files = depset(
            direct = [ctx.executable.bison_tool],
            transitive = [bison_runfiles, m4.all_files],
        ),
        bison_tool = ctx.attr.bison_tool.files_to_run,
        bison_env = bison_env,
    )

    return [
        platform_common.ToolchainInfo(bison_toolchain = toolchain),
        _template_vars(toolchain),
    ]

bison_toolchain_info = rule(
    _bison_toolchain_info,
    attrs = {
        "bison_tool": attr.label(
            executable = True,
            cfg = "host",
            default = "@bison//:bison_bin",
        ),
        "bison_env": attr.string_dict(),
    },
    provides = [
        platform_common.ToolchainInfo,
        platform_common.TemplateVariableInfo,
    ],
    toolchains = [_M4_TOOLCHAIN_TYPE],
)
