#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "%s\n" "Configuring tmux:"

printf "	%s" "Copying default tmux config..."
cp -f $DIR/tmux-common.conf $HOME/.tmux.conf
printf "%s\n" "Done"

platform=$(uname)
if [[ $platform == *Darwin* ]]
then
    printf "	%s" "Configuring tmux for Mac OS X..."
    cat $DIR/tmux-mac-osx.conf >> $HOME/.tmux.conf
    printf "%s\n" "Done"
fi

if ! { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
    tmux source-file $HOME/.tmux.conf
fi

printf "%s\n" "Configuring tmux: Done"

unset DIR
