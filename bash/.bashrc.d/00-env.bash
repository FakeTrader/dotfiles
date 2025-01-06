# Defining a Bash Variable With or Without ‘export’
# https://www.baeldung.com/linux/bash-variables-export

## Executable
# set PATH so it includes user's private bin if it exists
if [ -d "/opt/bin" ] ; then
  PATH="/opt/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# include more executables here
# or create links in ~/Applications/bin (use absolute path)
PATH="/Applications/Code/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

## Homebrew
# https://docs.brew.sh/Tips-N%27-Tricks
# https://docs.brew.sh/Shell-Completion
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# Homebrew
# PATH="$(brew --prefix)/path/to/bin:$PATH"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1

# GNU exec
if [ "$MANPATH" ]; then
    MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
    else
    MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman"
fi
PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="$HOMEBREW_PREFIX/opt/gettext/bin:$PATH"

## MySQL
PATH="$HOMEBREW_PREFIX/opt/mysql@8.0/bin:$PATH"
# export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# sqlite
PATH="$HOMEBREW_PREFIX/opt/sqlite/bin:$PATH"
# export LDFLAGS="-L/$HOMEBREW_PREFIX/opt/sqlite/lib"
# export CPPFLAGS="-I/$HOMEBREW_PREFIX/opt/sqlite/include"
# export PKG_CONFIG_PATH="/$HOMEBREW_PREFIX/opt/sqlite/lib/pkgconfig"

## LaTeX
# OPENTYPEFONTS option, which defaults to $TEXMFDOTDIR;$TEXMF/fonts/{opentype,truetype}//;$OSFONTDIR//.
# NOTE: suffix // means recursive search
export OSFONTDIR=$HOME/Library/Fonts//:/Library/Fonts//:/System/Library/Fonts//
export CHKTEXRC=$HOME/dotfiles/rc
export LATEXMKRCSYS=$HOME/dotfiles/rc/latexmkrc

## Compilers
# export LDFLAGS="-L/$HOMEBREW_PREFIX/opt/gettext/lib"
# export CPPFLAGS="-I/$HOMEBREW_PREFIX/opt/gettext/include"

# Algorithm 4
# export CLASSPATH="$CLASSPATH:~/Documents/algs4/algs4.jar"

# CodeExpander will automaticly add path to ~/.profile
# export PATH=$PATH:/Applications/CodeExpander.app/Contents/Resources/app/nodes:$HOME/.once-gui/installation/node_modules/.bin:/Applications/CodeExpander.app/Contents/Resources/app/node_modules/.bin

## FPGA
## toolchain
# export PATH="/opt/fpga-toolchain/bin:$PATH"
# export GHDL_PREFIX="/opt/fpga-toolchain/lib/ghdl"
# export PATH="/opt/oss-cad-suite/bin:$PATH"
## GTKWave
# export PATH="/Applications/gtkwave.app/Contents/Resources/bin:$PATH"

## NASA CDF library
# export PATH="$/Applications/cdf/cdf/bin:$PATH"
