# Defining a Bash Variable With or Without ‘export’
# https://www.baeldung.com/linux/bash-variables-export

## Executable
export PATH="$HOME/Applications/bin:$PATH"

## Homebrew
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# Homebrew
# PATH="$(brew --prefix)/path/to/bin:$PATH"
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=3
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

# GNU exec
# export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/sqlite/lib"
# export CPPFLAGS="-I/usr/local/opt/sqlite/include"
# export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"

## LaTeX
export OSFONTDIR=$HOME/Library/Fonts//:/Library/Fonts//:/System/Library/Fonts//
export CHKTEXRC=$HOME/dotfiles/rc
export LATEXMKRCSYS=$HOME/dotfiles/rc/latexmkrc

## Compilers
# export LDFLAGS="-L/usr/local/opt/gettext/lib"
# export CPPFLAGS="-I/usr/local/opt/gettext/include"

# Algorithm 4
# export CLASSPATH="$CLASSPATH:~/Documents/algs4/algs4.jar"

# CodeExpander will automaticly add path to ~/.profile
# export PATH=$PATH:/Applications/CodeExpander.app/Contents/Resources/app/nodes:/Users/whan/.once-gui/installation/node_modules/.bin:/Applications/CodeExpander.app/Contents/Resources/app/node_modules/.bin

## FPGA
## toolchain
# export PATH="$HOME/Applications/fpga-toolchain/bin:$PATH"
# export GHDL_PREFIX="$HOME/Applications/fpga-toolchain/lib/ghdl"
# export PATH="$HOME/Applications/oss-cad-suite/bin:$PATH"
## GTKWave
# export PATH="/Applications/gtkwave.app/Contents/Resources/bin:$PATH"

## NASA CDF library
# export PATH="$/Applications/cdf/cdf/bin:$PATH"
