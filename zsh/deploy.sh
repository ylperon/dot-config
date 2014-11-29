#!/bin/zsh
set -e

DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"

cp "${DIR}/zshrc.sh" "${HOME}/.zshrc"

source $HOME/.zshrc
