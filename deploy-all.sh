#!/usr/vin/env sh

printf "%s\n" "Configuring..."

printf "%s" "Configuring .profile..."
cp profile.sh $HOME/.profile
source $HOME/.profile
printf "%s\n" "Done"

printf "%s" "Configuring Tmux..."
./tmux/deploy-tmux-config.sh
printf "%s\n" "Done"

printf "%s" "Configuring Vim..."
./vim/deploy-vim-config.sh
printf "%s\n" "Done"

printf "%s\n" "Configuring...Done"
