## Alias configuration


#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac


#
# Quick Sequence Diagram Editor
#
alias sdeit='java -jar ~/src/java/sdedit-4.0-RC1.jar'


#
# git alias
#
alias gst="git status -s -b"
alias gcm="git commit -m "$*""
alias gb="git branch -a"


#
# ruby
#
alias be="bundle exec"


# For ssh login with tmux
alias ssh='TERM=screen ssh'
