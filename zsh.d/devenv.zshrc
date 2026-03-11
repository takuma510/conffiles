# PATH設定（最優先で設定）
export PATH=~/bin:/usr/local/bin:$PATH # brewで入れたコマンド優先

#
# brew
#
eval "$(/opt/homebrew/bin/brew shellenv)"

#
# Ruby
#

# rbenv
if command -v rbenv >/dev/null 2>&1; then
  export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH

  # one-time plugin/symlink setup (skipped if dirs already exist)
  rbenv_plugins=$HOME/.rbenv/plugins
  if [ ! -d $rbenv_plugins ]; then mkdir -p $rbenv_plugins; fi
  if [ ! -d $rbenv_plugins/rbenv-ctags ]; then
    git clone git://github.com/tpope/rbenv-ctags.git $rbenv_plugins/rbenv-ctags
  fi
  if [ ! -d $rbenv_plugins/rbenv-gem-rehash ]; then
    git clone git://github.com/sstephenson/rbenv-gem-rehash.git $rbenv_plugins/rbenv-gem-rehash
  fi
  if [ ! -d $rbenv_plugins/rbenv-default-gems ]; then
    git clone git://github.com/sstephenson/rbenv-default-gems.git $rbenv_plugins/rbenv-default-gems
  fi
  if [ ! -d $rbenv_plugins/gem-src ]; then
    git clone git://github.com/amatsuda/gem-src.git $rbenv_plugins/gem-src
  fi
  if [ ! -e $HOME/.rbenv/default-gems ]; then
    ln -s ~/conffiles/default-gems $HOME/.rbenv/default-gems
  fi

  rbenv() {
    unfunction rbenv
    eval "$(command rbenv init - zsh)"
    rbenv "$@"
  }
fi

# gem-src root directory (https://github.com/amatsuda/gem-src)
export GEMSRC_CLONE_ROOT="$HOME/src/gem"
if [ ! -d $GEMSRC_CLONE_ROOT ]; then
  mkdir -p $GEMSRC_CLONE_ROOT
fi

function cd_gemsrc() {
  cd $GEMSRC_CLONE_ROOT; ls
}

# default ruby opts
export RUBYOPT="-ropenssl"

# alias
alias be="bundle exec"

#
# Node.js
#

# nodenv
if command -v nodenv >/dev/null 2>&1; then
  export PATH=$HOME/.nodenv/bin:$HOME/.nodenv/shims:$PATH

  nodenv() {
    unfunction nodenv
    eval "$(command nodenv init - zsh)"
    nodenv "$@"
  }
fi

#
# Python
#

# pyenv
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH

  pyenv() {
    unfunction pyenv
    eval "$(command pyenv init - zsh)"
    if command pyenv which aws_zsh_completer.sh 1>/dev/null 2>&1; then
      source "$(command pyenv which aws_zsh_completer.sh)"
    fi
    pyenv "$@"
  }
fi

#
# Golang
#

# path
if [ -d $HOME/go ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

# goenv. see https://github.com/syndbg/goenv/blob/master/INSTALL.md
if command -v goenv >/dev/null 2>&1; then
  export GOENV_ROOT=$HOME/.goenv
  export PATH=$GOENV_ROOT/bin:$GOENV_ROOT/shims:$PATH

  goenv() {
    unfunction goenv
    eval "$(command goenv init - zsh)"
    goenv "$@"
  }
fi

#
# Java
#

# jenv (installed with brew)
if command -v jenv >/dev/null 2>&1; then
  export PATH=$HOME/.jenv/bin:$HOME/.jenv/shims:$PATH

  jenv() {
    unfunction jenv
    eval "$(command jenv init - zsh)"
    jenv "$@"
  }
fi


#
# Git
#

alias gst="git status -s -b"
alias gcm="git commit -m "$*""
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
alias dotnet=/usr/local/share/dotnet/dotnet
