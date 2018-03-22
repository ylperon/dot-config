#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f "${HOME}/.gdbinit"
cp "${DIR}/gdbinit" "${HOME}/.gdbinit"
cat "${DIR}/gdb-dashboard" >> "${HOME}/.gdbinit"
