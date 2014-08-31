#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/profile.sh $HOME/.profile
source $HOME/.profile

unset DIR
