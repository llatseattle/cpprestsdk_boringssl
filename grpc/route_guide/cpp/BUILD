package(default_visibility = ["//visibility:public"])

cc_library(
    name = "helper",
    srcs = ["helper.cc"],
    hdrs = ["helper.h"],
    deps = ["//grpc/route_guide/proto:cpp"],
)

cc_binary(
    name = "route_guide_client",
    srcs = ["route_guide_client.cc"],
    deps = [
      ":helper",
      "//grpc/helloworld/proto:cpp",
    ],
    data =[
        "//grpc/route_guide/data:route_guide_db.json",
    ],
)


cc_binary(
    name = "route_guide_server",
    srcs = ["route_guide_server.cc"],
    deps = [
      ":helper",
      "//grpc/helloworld/proto:cpp",
    ],
    data =[
        "//grpc/route_guide/data:route_guide_db.json",
    ],
)