"""# rules_bison

Bazel rules for GNU Bison.
"""

load(
    "//bison:bison.bzl",
    _BisonToolchainInfo = "BisonToolchainInfo",
    _bison = "bison",
    _bison_cc_library = "bison_cc_library",
    _bison_java_library = "bison_java_library",
    _bison_register_toolchain = "bison_register_toolchain",
    _bison_toolchain = "bison_toolchain",
)

bison = _bison
bison_cc_library = _bison_cc_library
bison_java_library = _bison_java_library
bison_register_toolchain = _bison_register_toolchain
bison_toolchain = _bison_toolchain
BisonToolchainInfo = _BisonToolchainInfo
