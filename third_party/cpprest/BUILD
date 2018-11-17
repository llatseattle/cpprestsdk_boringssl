licenses(["notice"])
exports_files(["LICENSES"])

cc_library(
    name = "cpprest",
    hdrs = glob(
        [
            "Release/include/cpprest/*.h",
            "Release/include/cpprest/http_msg.h",
            "Release/include/cpprest/http_headers.h",
            "Release/include/cpprest/http_client.h",
            "Release/include/cpprest/details/*.h",
            "Release/include/cpprest/details/*.hpp",
            "Release/include/pplx/*.h",
        ],
        exclude = [
            "Release/include/pplx/pplxwin.h",
        ],
    ),
    srcs = glob(
        [
            "Release/src/http/*/*.cpp",
            "Release/src/http/*/*.h",
            "Release/src/*/*.cpp",
            "Release/src/*/*.h",
            "Release/src/pch/stdafx.h",
            "Release/src/websockets/client/*.h",
            "Release/src/websockets/client/*.cpp",
        ],
        exclude = [
            "Release/src/android/asm/page.h",
            "Release/src/http/client/http_client_winhttp.cpp",
            "Release/src/http/client/http_client_winrt.cpp",
            "Release/src/http/listener/http_client_winrt.cpp",
            "Release/src/http/listener/http_server_httpsys.h",
            "Release/src/http/listener/http_server_httpsys.cpp",
            "Release/src/pplx/pplxapple.cpp",
            "Release/src/pplx/pplxwin.cpp",
            "Release/src/streams/fileio_win32.cpp",
            "Release/src/streams/fileio_winrt.cpp",
            "Release/src/websockets/client/ws_client_winrt.cpp",
        ],
    ),
    copts = [
        "-w",
        "-std=c++14",
        "-Iexternal/cpprest/Release/include",
        "-Iexternal/cpprest/Release/src/pch",
        "-Iexternal/boringssl/src/include",
        "-D_CASA_BUILD_FROM_SRC",
        "-DCPPREST_FORCE_HTTP_CLIENT_ASIO",
        "-DCPPREST_FORCE_HTTP_LISTENER_ASIO",
    ],
    deps = [
        "@boringssl//:ssl",
    ],
    includes = [
        "external/boringssl/src/include",
    ],
    linkopts = [
        "-lboost_system",
    ],
    linkstatic = 1,
    visibility = ["//visibility:public"],
)
