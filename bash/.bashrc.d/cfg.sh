# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Colour prompt
export color_prompt=yes
export CLICOLOR=yes

# bash completion (Homebrew)
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# bash on macOS 10.15+
# a) silence warning
export BASH_SILENCE_DEPRECATION_WARNING=1
# b) Install latest bash with homebrew
# go to System Preferences > Ussers & Groups, unlock, right click
# on user, Advanced Options, set Login shell to /usr/local/bin/bash
