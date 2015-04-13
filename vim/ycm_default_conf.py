from os import uname

FLAGS = [
    '-Weverything',
    '-std=c++14',

    # disable annoying warnings
    '-Wno-c++98-compat-pedantic',
    '-Wno-exit-time-destructors',
    '-Wno-global-constructors',
    '-Wno-missing-prototypes',
    '-Wno-missing-prototypes',
    '-Wno-missing-variable-declarations',
    '-Wno-padded',
    '-Wno-unused-macros',
]


def patch_flags_for_this_os():
    global FLAGS

    platform = uname()[0]

    if 'Darwin' == platform:
        FLAGS.append('-stdlib=libc++')
        FLAGS.append('-isystem')
        FLAGS.append('/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1')
    else:
        raise RuntimeError('Unknown platform!')


def FlagsForFile(filename, **kwars):
    patch_flags_for_this_os()

    return {'flags': FLAGS,
            'do_cache': True
            }
