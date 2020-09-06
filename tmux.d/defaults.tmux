# Prefixを＜Ctrl + b＞から＜Ctrl + t＞に変えます。
# 例：新しいウィンドウを開くときは＜Ctrl + t＞＜c＞と押すことになります。
set-option -g prefix C-t


# default shell
set-option -g default-shell /bin/zsh


# 再読み込み
unbind r
bind   r source-file ~/.tmux.conf


# バックスクロール行数を10万行に
set-option -g history-limit 100000


# 256色ターミナル
set-option -g default-terminal "screen-256color"


# ウィンドウ設定
source-file ~/.tmux.d/window.tmux


# ステイタスラインの設定
source-file ~/.tmux.d/status.tmux
