# Bash completition.
# http://bash-completion.alioth.debian.org/
#
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
