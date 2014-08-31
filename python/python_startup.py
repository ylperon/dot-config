# coding=utf-8
# vim: filetype=python

import atexit
import os
import readline
import rlcompleter

# via https://docs.python.org/2/tutorial/interactive.html
# For interactive python history file.

HISTORY_FILE_PATH = os.path.expanduser('~/.python_history')


def save_history(history_file_path=HISTORY_FILE_PATH):
    import readline
    readline.write_history_file(history_file_path)


if os.path.exists(HISTORY_FILE_PATH):
    readline.read_history_file(HISTORY_FILE_PATH)

atexit.register(save_history)

del atexit, os, readline, rlcompleter, save_history, HISTORY_FILE_PATH


# For interactive python autocompletion.
import readline
import rlcompleter

readline.parse_and_bind('tab: complete')
