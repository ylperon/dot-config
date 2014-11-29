#!/bin/zsh
set -e

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
    curl -L http://install.ohmyz.sh | sh
fi

DIR="$( cd "$( dirname "${(%):-%N}" )" && pwd )"

cp "${DIR}/zshrc.sh" "${HOME}/.zshrc"

source $HOME/.zshrc
