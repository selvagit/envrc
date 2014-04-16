
## Modified commands ## {{
#alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
alias ...='cd ../..'
alias back='cd $OLDPWD'
# }}}

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -s'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias netctl='sudo netctl'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias l='ls -CF'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 5 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "\033c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Make Bash error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}



export HISTCONTROL=erasedups
export HISTIGNORE="history *:cd *:df *:exit:fg:bg:file *:ll:ls:mc:top:clear"

shopt -s histappend

export PROMPT_COMMAND="history -a; history -n; history -r"


export CSCOPE_EDITOR=vim
export EDITOR=vim

export HISTTIMEFORMAT="%F %T "

shopt -s checkwinsize

#export PS1="\n\[\033[1;36m\]\u@\H\[\033[1;37m\] \[\033[0;36m\]`date`\n\[\033[0m\][\[\033[1;33m\]\w\[\033[0m\]]\] " 

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"

export PS1="\n$YELLOW\u@\H::\d::\t\n$GREEN[\w]$NORMAL$ " 

if [ $HOSTNAME == "buildbng1" ]
then
    cd /mnt/data0/vselvaraj/
else
    cd /net/buildbng1/mnt/data0/vselvaraj
fi

function calc { echo "${1}"|bc -l; }

source ~/git-completion.bash

# use capital letter when entering the value
# no 'ox' is required before the number 
h2d(){
  echo "ibase=16; $@"|bc
}

d2h(){
  echo "obase=16; $@"|bc
}

