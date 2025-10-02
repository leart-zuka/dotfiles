#!/bin/bash

[[ ! -d "$HOME/wq" ]] && echo "Please check if wiqi dir exists and is named wq" && exit 1

tmux has-session -t wiqi 2>/dev/null && tmux attach-session -t wiqi && exit 0  

cd "${HOME}/wq/"
tmux new-session -d -s wiqi -n bun
#
# Configure bun pane
tmux send-keys -t wiqi:0 "bun dev" C-m

# Create neovim pane
tmux new-window -t wiqi -n neovim
tmux send-keys -t wiqi:neovim "n" C-m

# Create the "lazygit" window with no command running
tmux new-window -t wiqi -n lazygit

# move to neovim window in the end
tmux select-window -t wiqi:neovim

# Switch to the tmux session
tmux attach-session -t wiqi
