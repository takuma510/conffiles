#
# Ruby
#

# rbenv
if which rbenv > /dev/null; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init - zsh)"

  # plugins
  local d=$(rbenv root)/plugins
  if [ ! -d $d ]; then mkdir -p $d; fi
  if [ ! -d $d/rbenv-ctags ]; then
    git clone git://github.com/tpope/rbenv-ctags.git $d/rbenv-ctags
  fi
  if [ ! -d $d/rbenv-gem-rehash ]; then
    git clone git://github.com/sstephenson/rbenv-gem-rehash.git $d/rbenv-gem-rehash
  fi
  if [ ! -d $d/rbenv-default-gems ]; then
    git clone git://github.com/sstephenson/rbenv-default-gems.git $d/rbenv-default-gems
  fi
  if [ ! -d $d/gem-src ]; then
    git clone git://github.com/amatsuda/gem-src.git $d/gem-src
  fi

  # default-gems
  if [ ! -e $(rbenv root)/default-gems ]; then
    ln -s ~/conffiles/default-gems $(rbenv root)/default-gems
  fi
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
# Python
#

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# awscli (installed with pyenv)
if pyenv which aws_zsh_completer.sh 1>/dev/null 2>&1; then
  source "$(pyenv which aws_zsh_completer.sh)"
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
if which goenv > /dev/null;then
  export GOENV_ROOT=$HOME/.goenv
  export PATH=$GOENV_ROOT/bin:$PATH
  eval "$(goenv init -)"
fi

#
# Java
#

# jenv (installed with brew)
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


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

# PATH
export PATH=~/bin:/usr/local/bin:$PATH # brewで入れたコマンド優先

#
# brew
#
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

#
# Node.js
#

# nodenv
eval "$(nodenv init -)"


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
