
PROMPT_COMMAND='history -a'

## Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

## Colour prompt
export color_prompt=yes
export CLICOLOR=yes

# enable color support of ls and also add handy aliases

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# export PS1="$PS1\[\e]1337;CurrentDir="'$(pwd)\a\]'

## bash completion (Homebrew)
# lead to slow startup
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
