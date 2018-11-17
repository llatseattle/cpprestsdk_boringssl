def _gen_config_impl(ctx):
    output = ctx.outputs.out

    content = ""
    for k, v in ctx.attr.values.items():
        content += "#define %s %s\n" % (k, v)

    ctx.file_action(
        output = output,
        content = content
    )

gen_config_rule = rule(
    implementation = _gen_config_impl,
    attrs = {
        "values": attr.string_dict(mandatory=True),
        "file": attr.string(mandatory=True),
    },
    outputs = {"out": "%{file}"},
    output_to_genfiles = True,
)

def cc_gen_config(name, file, values, visibility=None):
    config = gen_config_rule(
        name = name + "_impl",
        file = file,
        values = values,
    )

    native.cc_library(
        name = name,
        hdrs = [file],
        visibility = visibility,
    )

def _fix_config_impl(ctx):
    input = ctx.file.file
    output = ctx.outputs.out

    script = ""
    for k, v in ctx.attr.values.items():
        if ctx.attr.cmake:
            script += "s/\#cmakedefine[\s]+%s([\s]+\$\{%s\})?/\#define %s %s/g;" % (k, k, k, v)
        else:
            script += "s/\@%s\@/%s/g;" % (k, v)

    if ctx.attr.cmake:
        script += "s/\#cmakedefine[\s]+([^\s]+)([\s]+\$\{.+\})?//g"
    else:
        script += "s/\@[^\@]*\@/0/g"

    ctx.action(
        inputs = [input],
        outputs = [output],
        progress_message = "Configuring %s" % input.short_path,
        command = "perl -pe '%s' < %s > %s" % (script, input.path, output.path)
    )

fix_config_rule = rule(
    implementation = _fix_config_impl,
    attrs = {
        "file": attr.label(
            mandatory=True,
            allow_files=True,
            single_file=True
        ),
        "cmake": attr.bool(default=False, mandatory=False),
        "output": attr.string(mandatory=True),
        "values": attr.string_dict(mandatory=True),
    },
    outputs = {"out": "%{output}"},
    output_to_genfiles = True,
)

def cc_fix_config(name, files, values, cmake=False, visibility=None):
    hdrs = []
    for input, output in files.items():
        fix_config_rule(
            name = input + "_impl",
            file = input,
            cmake = cmake,
            output = output,
            values = values,
        )
        hdrs.append(output)

    native.cc_library(
        name = name,
        hdrs = hdrs,
        visibility = visibility,
    )
