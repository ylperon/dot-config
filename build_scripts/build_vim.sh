#!/usr/bin/env bash
set -e

function Usage {
    printf 'Usage: %s {-p|--prefix} DIR

Options:
    {-p|--prefix}   Path to the installation directory.
    {-h|--help}     Print usage.
' "$0" >&2
    exit 1
}

INSTALL_PREFIX=''

while [ $# -gt 0 ]; do
    case "$1" in
        -h)             Usage $0;;
        --help)         Usage $0;;
        -p)             INSTALL_PREFIX="$2";shift;;
        --prefix)       INSTALL_PREFIX="$2";shift;;
        -*)             printf 'Error: Unknown option "%s".\n' "$1" >&2;Usage $0;;
        *) break;;
    esac
    shift
done

if [ "$INSTALL_PREFIX" == '' ]; then
    printf 'Error: "{-p|--prefix}" is required.\n' >&2
    Usage $0
fi

INSTALL_PREFIX=$(echo "$(cd $INSTALL_PREFIX; pwd)")

### Actual building and installation.

## Platform dependent options

PLATFORM=$(uname)

MAKE_TOOL='make'
if [[ $PLATFORM == *FreeBSD* ]]; then
    MAKE_TOOL='gmake'
elif [[ $PLATFORM == *Darwin* ]]; then
    printf 'Use homebrew instead. See http://brew.sh/ for details.\n'
    exit 0
fi

## Download sources

TMP_DIR=$(mktemp -d -t 'vim_build.XXXXXXXXXX')

curl --fail --silent --show-error 'ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2' | \
    tar xj -f - -C $TMP_DIR &
curl --fail --silent --show-error 'ftp://invisible-island.net/ncurses/ncurses.tar.gz' | \
    tar xz -f - -C $TMP_DIR &
wait

# VIM_SOURCE_DIR=$(find $TMP_DIR -depth 1 -type d | egrep '\/vim\d\d$')
# NCURCES_SOURCE_DIR=$(find $TMP_DIR -depth 1 -type d | egrep '\/ncurses-\d\.\d$')
VIM_SOURCE_DIR=$TMP_DIR/vim74
NCURCES_SOURCE_DIR=$TMP_DIR/ncurses-5.9

## Building Ncurses

cd $NCURCES_SOURCE_DIR
./configure --prefix=$INSTALL_PREFIX \
            --enable-256-color \
            --with-shared \
            --silent
$MAKE_TOOL -j
$MAKE_TOOL install

## Building Vim

cd $VIM_SOURCE_DIR
CPPFLAGS="-I$INSTALL_PREFIX/include" LDFLAGS="-L$INSTALL_PREFIX/lib" ./configure --prefix=$INSTALL_PREFIX \
            --with-compiledby='Kostya Bazhanov. See https://github.com/kostyabazhanov/dot-config/tree/master/build_scripts/build_vim.sh for details.' \
            --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp \
            --enable-rubyinterp \
            --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
            --with-tlib=ncurses \
            --enable-gui=gtk2 \
            --enable-cscope \
            --disable-darwin \
            --disable-netbeans \
            --disable-gui \
            --disable-xsmp \
            --disable-xsmp-interact \
            --without-x \
            --silent
$MAKE_TOOL -j
$MAKE_TOOL install

## Give direction on how to start using it.

printf '\nAdd "%s/bin" to your $PATH to use this Vim binary by default.\n' "$INSTALL_PREFIX"

## Clearing

rm -rf $TMP_DIR

unset PLATFORM
unset TMP_DIR
unset INSTALL_PREFIX
unset VIM_SOURCE_DIR
unset NCURCES_SOURCE_DIR
