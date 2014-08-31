#!/usr/bin/env bash
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "%s\n" "Configuring..."

printf "%s" "Configuring .profile..."
$DIR/bash/deploy.sh
printf "%s\n" "Done"

printf "%s" "Configuring Tmux..."
$DIR/tmux/deploy.sh
printf "%s\n" "Done"

printf "%s" "Configuring Vim..."
$DIR/vim/deploy.sh
printf "%s\n" "Done"

printf "%s" "Configuring Python..."
$DIR/python/deploy.sh
printf "%s\n" "Done"

printf "%s\n" "Configuring...Done"

unset DIR
