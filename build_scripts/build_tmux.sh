#!/bin/bash
#
# Bash script to install Tmux on systems without root access.
set -e

usage() {
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
        -h)
            usage $0
            ;;
        --help)
            usage $0
            ;;
        -p)
            INSTALL_PREFIX="$2"
            shift
            ;;
        --prefix)
            INSTALL_PREFIX="$2"
            shift
            ;;
        -*)
            printf 'Error: Unknown option "%s".\n' "$1" >&2
            usage $0
            ;;
        *)
            break
            ;;
    esac
    shift
done

if [[ -z "${INSTALL_PREFIX}" ]]; then
    printf 'Error: "{-p|--prefix}" is required.\n' >&2
    usage $0
fi

INSTALL_PREFIX=$(echo "$(cd "${INSTALL_PREFIX}"; pwd)")

### Actual building and installation.

## Platform dependent options

PLATFORM=$(uname)

MAKE_TOOL='make'
if [[ "${PLATFORM}" == *FreeBSD* ]]; then
    MAKE_TOOL='gmake'
elif [[ "${PLATFORM}" == *Darwin* ]]; then
    printf 'Use homebrew instead. See http://brew.sh/ for details.\n'
    exit 1
fi

## Download sources

TMP_DIR="$(mktemp -d -t 'tmux_build.XXXXXXXXXX')"

cleanup() {
    rm -rf "{TMP_DIR}"
}

trap cleanup EXIT

wget --no-check-certificate --quiet 'http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz' --output-document -\
    | tar --extract --gzip --file - --directory "${TMP_DIR}" &
curl --fail --silent --show-error 'ftp://invisible-island.net/ncurses/ncurses.tar.gz' \
    | tar --extract --gzip --file - --directory "${TMP_DIR}" &
wget --no-check-certificate --quiet 'http://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.21-stable.tar.gz/download' --output-document - \
    | tar --extract --gzip --file - --directory "${TMP_DIR}" &
wait

TMUX_SOURCE_DIR="${TMP_DIR}/tmux-1.9a"
NCURCES_SOURCE_DIR="${TMP_DIR}/ncurses-5.9"
LIBEVENT_SOURCE_DIR="${TMP_DIR}/libevent-2.0.21-stable"

## Building Ncurses

cd "${NCURCES_SOURCE_DIR}"
./configure --prefix="${INSTALL_PREFIX}" \
            --enable-256-color \
            --disable-shared \
            --enable-static \
            --with-termlib \
            --with-ticlib \
            --silent
"${MAKE_TOOL}" -j --quiet
"${MAKE_TOOL}" install --quiet

## Building Libevent

cd "${LIBEVENT_SOURCE_DIR}"
./configure --prefix="${INSTALL_PREFIX}" \
            --disable-shared \
            --enable-static \
            --silent
"${MAKE_TOOL}" -j --quiet
"${MAKE_TOOL}" install --quiet

## Building Tmux

cd "${TMUX_SOURCE_DIR}"
CPPFLAGS="-I${INSTALL_PREFIX}/include" LDFLAGS="-L${INSTALL_PREFIX}/lib" ./configure \
            --prefix="${INSTALL_PREFIX}" \
            --enable-static \
            --silent
"${MAKE_TOOL}" -j --quiet
"${MAKE_TOOL}" install --quiet

## Give direction on how to start using it.

printf '\nAdd "%s/bin" to your $PATH to use this Tmux binary by default.\n' "${INSTALL_PREFIX}"
