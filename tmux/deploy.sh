#!/usr/bin/env bash
set -e

printf "%s\n" "Configuring tmux:"

printf "	%s" "Copying default tmux config..."
cp -f tmux-common.conf $HOME/.tmux.conf
printf "%s\n" "Done"

platform=$(uname)
if [[ $platform == *Darwin* ]]
then
    printf "	%s" "Configuring tmux for Mac OS X..."
    cat tmux-mac-osx.conf >> $HOME/.tmux.conf
    printf "%s\n" "Done"
fi

printf "%s\n" "Configuring tmux: Done"
