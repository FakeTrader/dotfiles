## Homebre
alias bi='brew install'
alias bl='brew list'
alias bson='brew services start'
alias bsoff='brew services stop'
alias bsr='brew services run'

alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'

alias bca='brew cu -a'
# alias bic='brew install --cask'
# alias buc='brew uninstall --cask'
# alias bif='brew install -f'
# alias buo='brew update && brew outdated'
alias bup='(set -x; brew update && brew outdated && brew upgrade && brew cleanup)'
alias bin='brew install'
alias brm='brew uninstall'

# Homebrew services
## Database
alias dbon='brew services run mysql@8.0; brew services run redis@7.2'
alias dboff='brew services stop mysql@8.0; brew services stop redis@7.2'

## MySQL
alias mysqlon='brew services run mysql@8.0'
alias mysqloff='brew services stop mysql@8.0'
# alias mysqlon='docker run --env MYSQL_ALLOW_EMPTY_PASSWORD=true --name mysql -d -p 3306:3306 mysql:latest'
# alias mysqloff='mysql.server stop'

## Redis
alias redison='brew services run redis@7.2'
alias redisoff='brew services stop redis@7.2'
# alias redison='redis-server /usr/local/etc/redis.conf'
# alias redisoff='redis-cli shutdown'
