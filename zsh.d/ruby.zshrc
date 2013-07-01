#### ruby settings

## rbenv
#

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"



## Gem
#

funtion install_system_gems() {
  echo "install system gems"
  cd ~/conffiles/system_setup
  cp ./SystemGemfile ./Gemfile
  bundle install
}

# bundle exec
alias be="bundle exec"



## rails
#

function cp_railsgem(){
  echo 'copy rails Gemfile'
  cp ~/conffiles/system_setup/RailsGemfile ./Gemfile
}

function install_default_rails() {
  echo "install default rails at `pwd`"
  cp ~/conffiles/system_setup/RailsGemfile ./Gemfile
  bundle install --path vendor/bundle
  echo "done... \^_^/"
}

function cleanup_for_installing_rails() {
  echo "cleanup_for_installing rails at `pwd`"
  rm -f Gemfile
  rm -f Gemfile.lock
  rm -rf .bundle
  rm -rf vendor/bundle
  echo "done... \^_^/"
}



## others
#

# default ruby opt
export RUBYOPT="-ropenssl"
