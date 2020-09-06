set-option -g status-interval 5
set-option -g status-style bg=black,bg=white
set-window-option -g window-status-current-style bg=blue,fg=white


# ステータスライン - Right
set -g status-right '< #[fg=black,bold]#(echo $LANG)#[default] < #[fg=blue]up #(pc-running-time.sh)#[default] < #[fg=magenta](#(loadaverage.sh)) Mem #(mac-used-mem.sh)%%#[default] < #[fg=red,bold]%y/%m/%d(%a)%H:%M:%S#[default] '


# Rightの表示領域最大長
set -g status-right-length 90
