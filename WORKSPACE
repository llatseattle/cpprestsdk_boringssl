
# 0. for rules_protobuf, which setup everything for protobuf and grpc
# https://github.com/llatseattle/rules_protobuf.git
git_repository(
    name = "org_pubref_rules_protobuf",
    remote = "https://github.com/llatseattle/rules_protobuf.git",
    commit = "794e303a631a12d8872358057e845bff0f9d34e8",
)

# local repository is removed
#local_repository(
     # this is a local version with tailored modification
#    name = "org_pubref_rules_protobuf",
#    path = "../rules_protobuf",
#)

load("@org_pubref_rules_protobuf//protobuf:rules.bzl", "proto_repositories")
proto_repositories()

load("@org_pubref_rules_protobuf//cpp:rules.bzl", "cpp_proto_repositories")
cpp_proto_repositories()

load("@org_pubref_rules_protobuf//python:rules.bzl", "py_proto_repositories")
py_proto_repositories()

# for python runtime support
# 1-A. Pull down rules_python
#http_archive(
#    name = "io_bazel_rules_python",
#    url = "https://github.com/bazelbuild/rules_python/archive/07fba0f91bb5898d19daeaabf635d08059f7eacd.zip",
#    sha256 = "53fecb9ddc5d3780006511c9904ed09c15a8aed0644914960db89f56b1e875bd",
#    strip_prefix = "rules_python-07fba0f91bb5898d19daeaabf635d08059f7eacd",
#)

# use my own fork
git_repository(
    name = "io_bazel_rules_python",
    remote = "https://github.com/llatseattle/rules_python.git",
    commit = "4dd4b2eaf7a0896282760b659342eb35683982c8",
)

# use a local repository instead
#local_repository(
#     # thisis a local version with tailored modification
#    name = "io_bazel_rules_python",
#    path = "../rules_python",
#)

# 1-B. Load the skylark file containing the needed functions
load("@io_bazel_rules_python//python:pip.bzl", "pip_repositories", "pip_import")

# 1-C. Invoke pip_repositories to load rules_python internal dependencies
pip_repositories()

# 1-D. Invoke pip_import with the necessary python requirements.  You can refer to the
# one in rules_protobuf, or roll your own (make sure it includes 'grpcio==1.6.0' (or later)).
pip_import(
   name = "pip_grpcio",
   requirements = "@org_pubref_rules_protobuf//python:requirements.txt",
)

# 1-E. Load the requirements.bzl file that will be written in this new workspace
# defined in 1-D.
load("@pip_grpcio//:requirements.bzl", pip_grpcio_install = "pip_install")

# 1-F. Invoke this new function to trigger pypi install of 'grpcio' when needed.
pip_grpcio_install()


# 1. gtest: https://github.com/google/googletest
# sudo apt install libgtest-dev
# 2. Boost: 
#local_repository(
#    name = "boost_local",
#    path = "../boost",
#)
#load("@boost_local//:boost/boost.bzl", "boost_deps")
#boost_deps()

# 2. gtest
new_git_repository(
    name   = "gtest",
    commit = "4de57ce787989d821d0736c5a12188eeaea3bf2d", #v2066
    remote = "https://github.com/google/googletest.git",
    build_file = "third_party/gtest/BUILD",
)

# 3. google flags from https://github.com/gflags
git_repository(
    name   = "com_github_gflags_gflags",
    commit = "77592648e3f3be87d6c7123eb81cbad75f9aef5a",
    remote = "https://github.com/gflags/gflags.git",
)

bind(
    name = "gflags",
    actual = "@com_github_gflags_gflags//:gflags",
)

bind(
    name = "gflags_nothreads",
    actual = "@com_github_gflags_gflags//:gflags_nothreads",
)

# 4. for glog
new_git_repository(
    name = "github_glog",
    remote = "https://github.com/google/glog.git",
    commit = "2063b387080c1e7adffd33ca07adff0eb346ff1a",
    build_file = "third_party/glog/BUILD"
)
bind(
    name = "glog",
    actual = "@github_glog//:glog"
)

# 5. cpprest
new_git_repository(
    name = "cpprest",
    remote = "https://github.com/llatseattle/cpprestsdk.git",
    commit = "0d5960e6dd12c34cb6ab77064c8c576feb8c33b5", #v2042
    build_file = "third_party/cpprest/BUILD",
)
