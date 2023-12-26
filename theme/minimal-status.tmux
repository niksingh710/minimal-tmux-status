set-option -g status-position "bottom"
set-option -g status-style bg=default,fg=default
set-option -g status-justify #{@minimal-tmux-justify}
set-option -g status-left '#[bg=default,fg=default,bold]#{?client_prefix,,#{@minimal-tmux-indicator-str}}#[bg=#{@minimal-tmux-bg},fg=black,bold]#{?client_prefix,#{@minimal-tmux-indicator-str},}'
set-option -g status-right '#S'
set-option -g window-status-format ' #I:#W '
set-option -g window-status-current-format '#[bg=#{@minimal-tmux-bg},fg=#000000] #I:#W#{?window_zoomed_flag, 󰊓 , }'
