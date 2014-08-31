#!/usr/bin/env bash
set -x

printf "%s\n" "Configuring..."

printf "%s" "Configuring .profile..."
./bash/deploy.sh
printf "%s\n" "Done"

printf "%s" "Configuring Tmux..."
./tmux/deploy.sh
printf "%s\n" "Done"

printf "%s" "Configuring Vim..."
./vim/deploy.sh
printf "%s\n" "Done"

printf "%s" "Configuring Python..."
./python/deploy.sh
printf "%s\n" "Done"

printf "%s\n" "Configuring...Done"
