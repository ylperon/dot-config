#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf 'Copying default Tmux config...\n'
cp -f "${DIR}/tmux-common.conf" "${HOME}/.tmux.conf"
printf 'Copying default Tmux config...DONE\n'

PLATFORM="$(uname)"
if [[ "${PLATFORM}" == *Darwin* ]]; then
    printf 'Configuring Tmux for Mac OS X...\n'
    cat "${DIR}/tmux-mac-osx.conf" >> "${HOME}/.tmux.conf"
    printf 'Configuring Tmux for Mac OS X...DONE\n'
fi

printf 'Configurint Tmux colorscheme...\n'
printf '\n' >> "${HOME}/.tmux.conf"
TMUX_COLORSCHEME_URL='https://raw.githubusercontent.com/seebi/tmux-colors-solarized/master/tmuxcolors-256.conf'
curl --fail --silent --show-error "${TMUX_COLORSCHEME_URL}" \
    >> "${HOME}/.tmux.conf"
printf 'Configurint Tmux colorscheme...DONE\n'

if ! { [ "${TERM}" = 'screen' ] && [ -n "${TMUX}" ]; } then
    tmux source-file $HOME/.tmux.conf > /dev/null
fi
