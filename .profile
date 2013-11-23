if [[ "$OSTYPE" == "darwin"* ]]; then
    PS1='me@yazevnul-mac:\W\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi

export LANG=en_US.UTF-8
export LC_CTYPE="ru_RU.UTF-8"
export LC_NUMERIC="C"
export LC_TIME="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_NAME="ru_RU.UTF-8"
export LC_ADDRESS="ru_RU.UTF-8"
export LC_TELEPHONE="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_IDENTIFICATION="ru_RU.UTF-8"

if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin

    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# SVN settings
export SVN_EDITOR=vim

# clang-analyzer
alias -- scan-build='~/tools/clang-analyzer/scan-build'
