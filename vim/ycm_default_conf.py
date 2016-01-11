import functools
import getpass
import inspect
import os
import re
import subprocess

_BASE_FLAGS = [
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


def memoize(fn):
    cache = fn.cache = {}

    @functools.wraps(fn)
    def memoizer(*args, **kwargs):
        kwargs.update(dict(zip(inspect.getargspec(fn).args, args)))
        key = tuple(kwargs.get(k, None) for k in inspect.getargspec(fn).args)
        if key not in cache:
            cache[key] = fn(**kwargs)
        return cache[key]
    return memoizer


@memoize
def _get_subprocess_output(cmd):
    process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT)
    output, unused_err = process.communicate('')
    retcode = process.poll()
    if retcode:
        raise subprocess.CalledProcessError(retcode, cmd, output=output)

    return output


@memoize
def retrieve_system_headers(compiler):
    if 'clang' == compiler:
        cmd = ('clang++', '-std=c++14', '-v', '-E', '-x', 'c++', '-', )
    elif 'gcc' == compiler:
        cmd = ('g++', '-std=c++14', '-v', '-E', '-x', 'c++', '-', )

    output = _get_subprocess_output(cmd)
    INCLUDES_RE = re.compile(
        r'''^#include <\.\.\.> search starts here:\n(.+)\nEnd of search list''',
        re.MULTILINE | re.DOTALL
    )
    includes = INCLUDES_RE.findall(output)
    assert includes, 'Can\'t parse system includes'
    assert 1 == len(includes), 'System includes are ambituious'
    return [os.path.abspath(x.strip()) for x in includes[0].split('\n')]


@memoize
def get_extra_flags_for_this_os():
    platform = os.uname()[0]
    if 'Darwin' == platform:
        compiler = 'clang'
    elif 'Linux' == platform:
        compiler = 'gcc'
    else:
        raise RuntimeError('Unknown platform')

    extra_flags = retrieve_system_headers(compiler)
    return extra_flags


@memoize
def get_extra_flags_for_this_host():
    username = getpass.getuser()
    if 'yazevnul' != username:
        return []

    platform = os.uname()[0]
    if 'Darwin' != platform:
        return []

    flags = ['-I', '/usr/local/Cellar/blaze-lib/2.4/include/',
             '-I', '/usr/local/Cellar/boost/1.59.0/include/',
             '-I', '/usr/local/Cellar/eigen/3.2.6/include',
             ]

    return flags


@memoize
def get_flags():
    flags = _BASE_FLAGS + get_extra_flags_for_this_os()
    return flags + get_extra_flags_for_this_host()


def FlagsForFile(filename, **kwars):
    flags = get_flags()

    return {'flags': flags,
            'do_cache': True
            }
