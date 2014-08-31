#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/python_startup.py $HOME/.python_startup

unset DIR
