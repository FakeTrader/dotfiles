## sign cr app (macOS)
# requires xcode dev
alias signapp='codesign --force --deep --sign - '
# F* Gatekeeper: allow run app (macOS)
alias fgk='xattr -rd com.apple.quarantine '
alias gatekeeperon='sudo spctl --master-enable'
alias gatekeeperoff='sudo spctl --master-disable'

alias dsclean='find . -name ".DS_Store" -type f -delete'
alias flush='dscahceutil -flushcache'
