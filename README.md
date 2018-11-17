# cpprestsdk_boringssl

Build a bazel project which includes: cpprestsdk + boringssl + grpc.
Originally cpprestsdk does not support boringssl but openssl.
grpc requires boringssl. If there is a project which needs both cpprestsdk and grpc, then it is hard to build with bazel.
This project gives a demo of how to make that work.

Even through no cpprestsdk + grpc joint project is not given. But this WORKSPACE is configured such that it will work. You can
check with following two seperate tests:

1. bazel run http:wss_test
2. In one terminal: bazel run grpc/route_guide/cpp:route_guide_server
   In another terminal: bazel run grpc/route_guide/cpp:route_guide_client
