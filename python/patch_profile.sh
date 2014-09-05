#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf '\n' >> $HOME/.profile
cat $DIR/profile_patch.sh >> $HOME/.profile

unset DIR
