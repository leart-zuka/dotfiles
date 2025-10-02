#!/bin/bash

path="$HOME/Documents/uni/master/master_thesis/"

[[ ! -d $path ]] && echo "Please check if master thesis dir exists" && exit 1

tmux has-session -t master_thesis 2>/dev/null && tmux attach-session -t master_thesis && exit 0  

cd "$path" &>/dev/null
tmux new-session -d -s master_thesis -n literature

# Configure literature pane
tmux send-keys -t master_thesis:0 "cd ./reading_material/; " C-m

# Create notes pane
tmux new-window -t master_thesis -n notes
tmux send-keys -t master_thesis:notes "cd ./notes; glow" C-m

# Create code pane
tmux new-window -t master_thesis -n code
tmux send-keys -t master_thesis:code "cd ./code; n" C-m

# Select literature pane
tmux select-window -t master_thesis:literature

# Switch to the tmux session
tmux attach-session -t master_thesis
