# https://github.com/ohmybash/oh-my-bash/tree/master/aliases
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
# https://github.com/mathiasbynens/dotfiles/blob/main/.aliases
# Reload the shell (i.e. invoke as a login shell)
alias reload='exec ${SHELL} -l'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# clear screen
alias cls='clear'
alias c='clear'

# file manage
alias ll='ls -lAFh -I .DS_Store'
alias ls='ls -FG'
# alias ls='ls --color=auto'
# alias ls='ls --color=tty'

alias grep='grep --color=auto'
# alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# Command line head / tail shortcuts
# alias -g H='| head'
# alias -g T='| tail'
# alias -g G='| grep'
# alias -g L="| less"
# alias -g M="| most"
# alias -g LL="2>&1 | less"
# alias -g CA="2>&1 | cat -A"
# alias -g NE="2> /dev/null"
# alias -g NUL="> /dev/null 2>&1"
# alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
# (( $+commands[duf] )) || alias duf='du -sh *'
# (( $+commands[fd] )) || alias fd='find . -type d -name'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

# Ubuntu
alias aptin='sudo apt-get install --no-install-recommends'
alias aptrm='sudo apt-get remove'

# ------------------------------------------------------------------------------
# | Navigation                                                                 |
# ------------------------------------------------------------------------------

# Push and pop directories on directory stack
# alias pu='pushd'
# alias po='popd'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# fallback by typo
alias cd~='cd ~'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

# ------------------------------------------------------------------------------
# | Directories Commands (create / remove)                                     |
# ------------------------------------------------------------------------------

# mkdir: always create parent-dirs, if needed
# alias mkdir='mkdir -p'
alias md='mkdir -p'
# rmdir
alias rd='rmdir'

# dirs
# alias d='dirs -v | head -10'

# create a dir with date from today
# alias mkdd='mkdir $(date +%Y%m%d)'

# alias rm='rm -I'    # 'rm -i' prompts for every file


alias k='kill -9'

# alias portkill='function _killp(){ lsof -nti:$1 | xargs kill -9 };_killp'
# alias pk='function _killp(){ lsof -nti:$1 | xargs kill -9 };_killp'
# alias pk='portkill'
alias kp='killPort'

## Apps
## Terminal

## wget断点续传
alias wget='wget -c '
## start aria2 deamon
alias aria2='aria2c --conf-path=$(echo ~)"/.aria2/aria2.conf" -D'
# alias aria2="aria2c --conf-path=$(echo ~)'/.aria2/aria2.conf' -D"

## file  operation
alias cpv='rsync -ah --info=progress2'
alias copy='rsync -avv --stats --human-readable --itemize-changes --progress --partial'

## hexo
# alias hexo='docker run --rm -p 4000:4000 -v ${PWD}:/blog 'hexo' hexo '

alias tree='tree -N'

# tmux
alias tm='tmux new -As main'
alias tls='tmux ls'
alias tnew='tmux new -s'
alias tat='tmux a -t'

alias datax='python3 /opt/datax/bin/datax.py'

## nacos
alias nacoson='bash /opt/nacos/bin/startup.sh -m standalone'
alias nacosoff='bash /opt/nacos/bin/shutdown.sh'
# alias nacoson='docker run --env MODE=standalone --name nacos -d -p 8848:8848 -p 9848:9848 nacos/nacos-server'
# alias nacosoff='sh $HOME/Applications/nacos/bin/shutdown.sh'

alias flowable='java -jar -Dspring.config.location=/opt/flowable/application.yml /opt/flowable/flowable-ui.war'

## kill process
# pkill
# or
# pgrep <> | xargs kill -9
# alias killtb="ps -ef | grep tensorboard | awk '{print $2}' | xargs kill -9"
# alias killtrain="ps -ef | grep train | awk '{print $2}' | xargs kill -9"

## Google Cloud
# gcloud auth login
# gcloud config set project mml-23
alias gc="gcloud compute"
alias gcs="gcloud compute ssh"
alias gcl="gcloud compute instances list"
alias gci="gcloud compute instances"

alias imgtovmdk="qemu-img convert -f raw -O vmdk"

## TeXLive
# alias tlmgr='sudo tlmgr'

## GUI
# Turbo Boost Switcher
# alias tbs='sudo -b /Applications/Turbo\ Boost\ Switcher.app/Contents/MacOS/Turbo\ Boost\ Switcher'

## Parallels Desktop
# alias pd='sudo -b -S /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_client_app'
