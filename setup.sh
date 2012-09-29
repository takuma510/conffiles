#!/bin/sh

echo "setup conffiles..."

echo "setup ~/.zsh.d"
ln -s conffiles/zsh.d ~/.zsh.d
cd ~/.zsh.d
./setup.sh

echo "setup ~/.vim.d"
ln -s conffiles/vim.d ~/.vim.d
cd ~/.vim.d
./setup.sh

echo "setup ~/.tmux.d"
ln -s confiles/tmux.d ~/.tmux.d
cd ~/.tmux.d
./setup.sh

echo "setup ~/bin"
ln -s conffiles/bin ~/bin

echo "done... \^_^/"
