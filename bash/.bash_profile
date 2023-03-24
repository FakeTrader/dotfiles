# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

export PATH=$PATH:/Applications/CodeExpander.app/Contents/Resources/app/nodes:/Users/whan/.once-gui/installation/node_modules/.bin:/Applications/CodeExpander.app/Contents/Resources/app/node_modules/.bin

