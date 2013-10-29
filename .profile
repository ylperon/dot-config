PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '

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

alias pdflatex=/usr/texbin/pdflatex
alias bibtex=/usr/texbin/bibtex
alias xelatex=/usr/texbin/xelatex

if [[ "$OSTYPE" == "darwin"* ]]; then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
fi

# SVN settings
export SVN_EDITOR=vim
