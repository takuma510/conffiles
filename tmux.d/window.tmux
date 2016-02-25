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

bind-key -t emacs-copy C-Enter copy-pipe "reattach-to-user-namespace pbcopy"



#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green
