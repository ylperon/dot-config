#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf 'Copying default Tmux config...\n'
cp -f $DIR/tmux-common.conf $HOME/.tmux.conf
printf 'Copying default Tmux config...DONE\n'

platform=$(uname)
if [[ $platform == *Darwin* ]]
then
    printf 'Configuring Tmux for Mac OS X...\n'
    cat $DIR/tmux-mac-osx.conf >> $HOME/.tmux.conf
    printf 'Configuring Tmux for Mac OS X...DONE\n'
fi

if ! { [ "$TERM" = 'screen' ] && [ -n "$TMUX" ]; } then
    tmux source-file $HOME/.tmux.conf > /dev/null
fi

unset DIR
