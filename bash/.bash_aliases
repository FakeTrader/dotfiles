## The Fuck
eval $(thefuck --alias f)
# eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
# eval $(thefuck --alias FUCK)

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# file mng
# Reload the shell (i.e. invoke as a login shell)
alias reload='exec ${SHELL} -l'

alias ls='ls -FG'
# alias ls='ls --color=auto'
# alias ls='ls --color=tty'

# ------------------------------------------------------------------------------
# | Navigation                                                                 |
# ------------------------------------------------------------------------------

# Push and pop directories on directory stack
# alias pu='pushd'
# alias po='popd'

# Easier navigation: .., ..., ...., ....., ~ and -
alias ~='cd ~'      # `cd` is probably faster to type though
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'

# fallback by typo
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

# ------------------------------------------------------------------------------
# | Directories Commands (create / remove)                                     |
# ------------------------------------------------------------------------------

# mkdir: always create parent-dirs, if needed
# alias mkdir='mkdir -p'
# alias md='mkdir'

# dirs
# alias d='dirs -v | head -10'

# rmdir
# alias rd='rmdir'

# create a dir with date from today
# alias mkdd='mkdir $(date +%Y%m%d)'

# alias rm='rm -I'    # 'rm -i' prompts for every file

# Apps
# Terminal
# wget断点续传
alias wget='wget -c'
# start aria2 deamon
alias aria2="aria2c --conf-path=$(echo ~)'/.aria2/aria2.conf' -D"

# sign cr app (macOS)
alias signapp="codesign --force --deep --sign - "
# allow run app (macOS)
alias fgk="xattr -rd com.apple.quarantine "

# file  operation
alias cpv='rsync -ah --info=progress2'
alias copy='rsync -avv --stats --human-readable --itemize-changes --progress --partial'

## hexo
# alias hexo='docker run --rm -p 4000:4000 -v ${PWD}:/blog 'hexo' hexo '


## Conda
alias cab='conda activate base'
alias ca='conda activate'

## Homebrew Cask
alias bca='brew cu -a'
# alias bic='brew install --cask'
# alias buc='brew uninstall --cask'
# alias bif='brew install -f'
alias buo='brew update && brew outdated'

# tmux
alias tmain='tmux new -As main'

## Python
alias pip='python -m pip'
alias py='python'

## MySQL
alias mysqlon='mysql.server start'
alias mysqloff='mysql.server stop'

## Google Cloud
# gcloud auth login
# gcloud config set project mml-23
alias gc="gcloud compute"
alias gcs="gcloud compute ssh"
alias gcl="gcloud compute instances list"
alias gci="gcloud compute instances"

## TeXLive
# alias tlmgr='sudo tlmgr'

## GUI
# Turbo Boost Switcher
# alias tbs='sudo -b /Applications/Turbo\ Boost\ Switcher.app/Contents/MacOS/Turbo\ Boost\ Switcher'

## Parallels Desktop
# alias pd='sudo -b -S /Applications/Parallels\ Desktop.app/Contents/MacOS/prl_client_app'
