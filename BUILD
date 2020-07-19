package(default_visibility = ["//visibility:public"])

filegroup(
    name = "windows-x86",
    srcs = glob(["**"]),
)

filegroup(
    name = "windows-x86-bundle",
    srcs = glob(
        include = ["Lib/x64/**"],
        exclude = [
            "Lib/x64/test/**",
            "Lib/x64/unittest/**",
            "Lib/x64/config/**",
            "Lib/x64/distutils/**",
            "Lib/x64/idlelib/**",
            "Lib/x64/lib2to3/**",
            "Lib/x64/plat-linux2/**",
            "Lib/x64/bsddb/test/**",
            "Lib/x64/ctypes/test/**",
            "Lib/x64/email/test/**",
            "Lib/x64/lib-tk/test/**",
            "Lib/x64/sqlite3/test/**",
        ],
    ),
)
