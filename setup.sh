#!/bin/sh

echo "setup conffiles..."

echo "clean up links"
rm ~/.zsh.d ~/.vim.d ~/.tmux.d ~/bin ~/.rubocop.yml

echo "setup ~/.emacs.d"
ln -s ~/conffiles/emacs.d ~/.emacs.d

echo "setup ~/.zsh.d"
ln -s ~/conffiles/zsh.d ~/.zsh.d
cd ~/.zsh.d/utils
./setup.sh

echo "setup ~/.vim.d"
ln -s ~/conffiles/vim.d ~/.vim.d
cd ~/.vim.d/utils
./setup.sh

echo "setup ~/.tmux.d"
ln -s ~/conffiles/tmux.d ~/.tmux.d
cd ~/.tmux.d/utils
./setup.sh

echo "setup ~/bin"
ln -s ~/conffiles/bin ~/bin

echo "setup ~/.rubocop.yml"
ln -s ~/conffiles/rubocop.yml ~/.rubocop.yml

echo "done... \^_^/"
