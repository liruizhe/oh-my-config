#!/usr/bin/env fish

function set_tmux_env
	tmux $argv > /dev/null ^ /dev/null
	#tmux $argv
end

set_tmux_env set-window-option -g mode-keys vi

set_tmux_env set-option -g mode-mouse on
set_tmux_env set-option -g mouse-resize-pane on
set_tmux_env set-option -g mouse-select-pane on
set_tmux_env set-option -g mouse-select-window on

set_tmux_env set-option -g status on
set_tmux_env set-option -g status-interval 2
set_tmux_env set-option -g status-utf8 on
set_tmux_env set-option -g status-justify "centre"
set_tmux_env set-option -g status-left-length 60
set_tmux_env set-option -g status-right-length 90
set_tmux_env set-option -g status-left "#(~/.oh-my-config/tmux-powerline/powerline.sh left)"
set_tmux_env set-option -g status-right "#(~/.oh-my-config/tmux-powerline/powerline.sh right)"

set_tmux_env bind-key a send-prefix
set_tmux_env bind-key C-a send-prefix

# getting tmux to copy a buffer to system clipboard
set_tmux_env bind C-c run "tmux save-buffer - | reattach-to-user-namespace pbcopy" \\\; display-message "Copied tmux buffer to system clipboard"
set_tmux_env bind C-v run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"

if which reattach-to-user-namespace > /dev/null ^ /dev/null
	exec reattach-to-user-namespace -l fish
else
	echo "Hello World!"
	exec fish
end
