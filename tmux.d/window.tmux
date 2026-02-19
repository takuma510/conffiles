# ウィンドウの移動
# Prefix(ここではCtrl+t)を連続入力することでウィンドウを移動させます。

bind C-t next-window


# ウィンドウを(ペインに)分割
# ＜Prefix＞＜v＞、＜Prefix＞＜h＞と入力するだけで分割できるようにします。

bind h split-window -h
bind v split-window -v


# ペインのサイズ変更をvim風にする
# ＜Prefix＞＜Ctrl + { h | i | j | k }＞
# ＜Ctrl + { h | i | j | k }＞は連続して入力可能。
# 1回押すごとに5行(列)境界を移動させる。

bind -r C-h resize-pane -L 5
bind -r C-l resize-pane -R 5
bind -r C-j resize-pane -D 5
bind -r C-k resize-pane -U 5


# ペインの移動1(Vim風にする)

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R


# ペインの移動2
# Shift + 上下左右でペインを移動できるようにする。(＜Prefix＞不要)
# 行頭に"bind -n"をつけるとPrefixが不要になる。

bind -n S-left select-pane -L
bind -n S-down select-pane -D
bind -n S-up select-pane -U
bind -n S-right select-pane -R


# コピーモードのコピーバッファをOSXのクリップボードに
# 事前にreattach-to-user-namespaceをインストールする事

bind-key -T copy-mode-emacs C-Enter send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"


# コピーモード(vi)でのページ移動
# Ctrl+P で1ページ上に、Ctrl+N で1ページ下に移動

bind-key -T copy-mode-vi C-p send-keys -X page-up
bind-key -T copy-mode-vi C-n send-keys -X page-down


# コピーモード(vi)でmacOSクリップボードにコピー
# Enterキーでコピーしてコピーモードを終了し、クリップボードにも保存

bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"


#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-style bg=colour235,fg=colour136,default

# default window title colors
set-window-option -g window-status-style fg=colour244,bg=default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-style fg=colour166,bg=default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-lines double
set-option -g pane-border-style fg=colour235
set-option -g pane-active-border-style fg=colour240

# message text
set-option -g message-style bg=colour235,fg=colour166

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green
