# 端末起動時にtmuxを起動
if [ $SHLVL = 1 ]; then
  tmux attach || tmux
  echo "hello tmux"
fi

echo "hello zsh"
