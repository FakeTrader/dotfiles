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

## FPGA
## toolchain
# export PATH="$HOME/Applications/fpga-toolchain/bin:$PATH"
# export GHDL_PREFIX="$HOME/Applications/fpga-toolchain/lib/ghdl"
# export PATH="$HOME/Applications/oss-cad-suite/bin:$PATH"
## GTKWave
# export PATH="/Applications/gtkwave.app/Contents/Resources/bin:$PATH"
