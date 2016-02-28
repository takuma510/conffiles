#
# Ruby
#

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

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


#
# Editor
#
export EDITOR=ec
