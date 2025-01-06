# bash on macOS 10.15+
# a) silence warning
export BASH_SILENCE_DEPRECATION_WARNING=1
# b) Install latest bash with homebrew
# go to System Preferences > Ussers & Groups, unlock, right click
# on user, Advanced Options, set Login shell to /usr/local/bin/bash

## sign cr app (macOS)
# requires xcode dev
alias signapp='codesign --force --deep --sign - '
# F* Gatekeeper: allow run app (macOS)
alias fgk='xattr -rd com.apple.quarantine '
alias gatekeeperon='sudo spctl --master-enable'
alias gatekeeperoff='sudo spctl --master-disable'

alias dsclean='find . -name ".DS_Store" -type f -delete'
alias flush='dscahceutil -flushcache'
