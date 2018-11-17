# cpprestsdk_boringssl
Build a bazel project which includes: cpprestsdk + boringssl + grpc
Originally cpprestsdk does not support boringssl but openssl.
grpc requires boringssl. If there is a project which needs both cpprestsdk and grpc, then it is hard to build with bazel.
This project gives a demo of how to make that work.
