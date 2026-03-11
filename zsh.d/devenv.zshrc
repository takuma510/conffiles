# PATH設定（最優先で設定）
export PATH=~/bin:/usr/local/bin:$PATH # brewで入れたコマンド優先

#
# brew
#
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#
# Ruby (rbenv)
#
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"

  # one-time plugin/symlink setup (skipped if dirs already exist)
  rbenv_plugins=$HOME/.rbenv/plugins
  if [ ! -d $rbenv_plugins ]; then mkdir -p $rbenv_plugins; fi
  [ ! -d $rbenv_plugins/rbenv-ctags ] && git clone git://github.com/tpope/rbenv-ctags.git $rbenv_plugins/rbenv-ctags
  [ ! -d $rbenv_plugins/rbenv-gem-rehash ] && git clone git://github.com/sstephenson/rbenv-gem-rehash.git $rbenv_plugins/rbenv-gem-rehash
  [ ! -d $rbenv_plugins/rbenv-default-gems ] && git clone git://github.com/sstephenson/rbenv-default-gems.git $rbenv_plugins/rbenv-default-gems
  [ ! -d $rbenv_plugins/gem-src ] && git clone git://github.com/amatsuda/gem-src.git $rbenv_plugins/gem-src
  if [ ! -e $HOME/.rbenv/default-gems ]; then
    ln -s ~/conffiles/default-gems $HOME/.rbenv/default-gems
  fi
fi

# gem-src root directory (https://github.com/amatsuda/gem-src)
export GEMSRC_CLONE_ROOT="$HOME/src/gem"
[ ! -d $GEMSRC_CLONE_ROOT ] && mkdir -p $GEMSRC_CLONE_ROOT

function cd_gemsrc() {
  cd $GEMSRC_CLONE_ROOT; ls
}

# default ruby opts
export RUBYOPT="-ropenssl"

# alias
alias be="bundle exec"

#
# Node.js (nodenv)
#
if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init - zsh)"
fi

#
# Python (pyenv)
#
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
  if command pyenv which aws_zsh_completer.sh 1>/dev/null 2>&1; then
    source "$(command pyenv which aws_zsh_completer.sh)"
  fi
fi

#
# Golang (goenv)
#
if [ -d $HOME/go ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

if command -v goenv >/dev/null 2>&1; then
  eval "$(goenv init - zsh)"
fi

#
# Java (jenv)
#
if command -v jenv >/dev/null 2>&1; then
  eval "$(jenv init - zsh)"
fi

#
# Git
#
alias gst="git status -s -b"
alias gcm='git commit -m'
alias gb="git branch -a"

#
# Editor
#
export EDITOR=vim

# For ssh login with tmux
alias ssh='TERM=screen ssh'

#
# AWS
#

# ssm by tag:Name
alias sm=$HOME/.zsh.d/utils/ssm.sh

#
# dotnet
#

# package download binary
[ -x /usr/local/share/dotnet/dotnet ] && alias dotnet=/usr/local/share/dotnet/dotnet
