# Load Homebrew before other commands
eval "$(/opt/homebrew/bin/brew shellenv)"

# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

# custom configs
if [ -d "$HOME/.bashrc.d" ] ; then
  for file in $HOME/.bashrc.d/*.bash; do
    . $file
  done
  unset file
fi

mesg n || true

# # Managed by CodeExpander
# export PATH=$PATH:/Applications/CodeExpander.app/Contents/Resources/app/nodes:$HOME/.once-gui/installation/node_modules/.bin:/Applications/CodeExpander.app/Contents/Resources/app/node_modules/.bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
