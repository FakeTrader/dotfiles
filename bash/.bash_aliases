## The Fuck
eval $(thefuck --alias f)
# eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
# eval $(thefuck --alias FUCK)

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec ${SHELL} -l'

alias cls='clear'

# file manage
alias ls='ls -FG'
# alias ls='ls --color=auto'
# alias ls='ls --color=tty'

alias grep='grep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Ubuntu
alias aptin='sudo apt install --no-install-recommends'
alias aptrm='sudo apt remove'

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
# alias -- -='cd -'

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

## Apps
## Terminal
## wget断点续传
alias wget='wget -c '
## start aria2 deamon
alias aria2='aria2c --conf-path=$(echo ~)"/.aria2/aria2.conf" -D'
# alias aria2="aria2c --conf-path=$(echo ~)'/.aria2/aria2.conf' -D"

## sign cr app (macOS)
# requires xcode dev
alias signapp='codesign --force --deep --sign - '
# F* Gatekeeper: allow run app (macOS)
alias fgk='xattr -rd com.apple.quarantine '

## file  operation
alias cpv='rsync -ah --info=progress2'
alias copy='rsync -avv --stats --human-readable --itemize-changes --progress --partial'

## hexo
# alias hexo='docker run --rm -p 4000:4000 -v ${PWD}:/blog 'hexo' hexo '

alias tree='tree -N'

## Conda
alias ca='conda activate'

## Homebrew
alias bca='brew cu -a'
# alias bic='brew install --cask'
# alias buc='brew uninstall --cask'
# alias bif='brew install -f'
alias buo='brew update && brew outdated'
alias bup='brew update && brew outdated && brew upgrade'
alias bin='brew install'
alias brm='brew uninstall'

# tmux
alias tm='tmux new -As main'
alias tls='tmux ls'
alias tnew='tmux new -s'
alias tat='tmux a -t'

## Python
alias py='python3'
alias pip='python3 -m pip'
alias pin='python3 -m pip install'
alias prm='python3 -m pip uninstall'
alias ipy='ipython'

## MySQL
alias mysqlon='brew services start mysql@8.0'
alias mysqloff='brew services stop mysql@8.0'
# alias mysqlon='docker run --env MYSQL_ALLOW_EMPTY_PASSWORD=true --name mysql -d -p 3306:3306 mysql:latest'
# alias mysqloff='mysql.server stop'

## Redis
alias redison='brew services start redis@7.2'
alias redisoff='brew services stop redis@7.2'
# alias redison='redis-server /usr/local/etc/redis.conf'
# alias redisoff='redis-cli shutdown'

## nacos
alias nacoson='bash $HOME/Applications/nacos/bin/startup.sh -m standalone'
alias nacosoff='bash $HOME/Applications/nacos/bin/shutdown.sh'
# alias nacoson='docker run --env MODE=standalone --name nacos -d -p 8848:8848 -p 9848:9848 nacos/nacos-server'
# alias nacosoff='sh $HOME/Applications/nacos/bin/shutdown.sh'


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
