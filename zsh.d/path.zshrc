export PATH=~/bin:$PATH # 自作command
export PATH=/usr/local/bin:$PATH # brewで入れたコマンド優先
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

# golang
if [ -d $HOME/go ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi
