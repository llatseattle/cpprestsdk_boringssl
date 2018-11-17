package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "wss_test",
    srcs = [
        "wss_test.cc",
    ],
    deps = [
        "@cpprest//:cpprest",
    ],
    copts = [
        "-w",
        "-std=c++14",
        "-Iexternal/cpprest/Release/include",
    ],
    linkstatic = 1,
)