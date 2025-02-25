# Load .env
source $HOME/.env

## Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# export MANPATH="/usr/local/man:$MANPATH"

## LaTeX
# OPENTYPEFONTS option, which defaults to $TEXMFDOTDIR;$TEXMF/fonts/{opentype,truetype}//;$OSFONTDIR//.
# NOTE: suffix // means recursive search
export OSFONTDIR=$HOME/Library/Fonts//:/Library/Fonts//:/System/Library/Fonts//
export CHKTEXRC=$HOME/dotfiles/rc
export LATEXMKRCSYS=$HOME/dotfiles/rc/latexmkrc
