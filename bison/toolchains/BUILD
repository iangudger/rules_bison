load("//bison:toolchain_type.bzl", "BISON_TOOLCHAIN_TYPE")
load("//bison/internal:toolchain_info.bzl", "bison_toolchain_info")

toolchain(
    name = "bison",
    toolchain = ":toolchain_info",
    toolchain_type = BISON_TOOLCHAIN_TYPE,
)

bison_toolchain_info(
    name = "toolchain_info",
    visibility = ["//visibility:public"],
)
