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
# Editor
#
export EDITOR=ec
