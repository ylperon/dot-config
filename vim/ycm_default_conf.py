from os import uname

FLAGS = ['-Wall',
         '-Wextra',
         '-Werror',
         '-std=c++11',
         '-stdlib=libc++',
         ]


def patch_flags_for_this_os():
    global FLAGS

    platform = uname()[0]

    if 'Darwin' == platform:
        FLAGS.append('-isystem')
        FLAGS.append('/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1')
    else:
        raise RuntimeError('Unknow platform!')


def FlagsForFile(filename, **kwars):
    patch_flags_for_this_os()

    return {'flags': FLAGS,
            'do_cache': True
            }
