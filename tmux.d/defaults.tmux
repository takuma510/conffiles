# Prefixを＜Ctrl + b＞から＜Ctrl + t＞に変えます。
# 例：新しいウィンドウを開くときは＜Ctrl + e＞＜c＞と押すことになります。
set-option -g prefix C-t


# default shell
set-option -g default-shell /bin/zsh


# ウィンドウ設定
source-file ~/.tmux.d/window.tmux


# 再読み込み
unbind r
bind   r source-file ~/.tmux.conf
