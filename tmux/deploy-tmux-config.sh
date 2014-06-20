#!/usr/bin/env sh

printf "%s" "Copying default tmux config..."
cp -f tmux-common.conf ~/.tmux.conf
printf "%s\n" "Done"
