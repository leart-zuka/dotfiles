# Aliases
alias ls='ls --color=auto'
alias ff='firefox'
alias e='exit'
alias cd..='cd ..'
alias gg='git pull'
alias gf='git fetch'
alias gc='git checkout'
alias gs='git status'
alias lz='lazygit'
alias cl='clear'
alias activate='source .venv/bin/activate.fish'
alias pytest='python -m pytest'
alias music='ncmpcpp'
alias p='pnpm'
alias n='nvim'
alias t="tmux"
alias b="bun"

# Keybinds (Disable fish keybinds for ESC+L and ESC+Ctrl+L)
bind \el ""
bind \e\cl ""

# Function to automatically add, commit, and push all files in current directory
function ggg
  git add .
  git commit -m $argv
  git push
end

# Function to move into notes dir, create notefile, and open it with nvim
function on
    if test (count $argv) != 1
        echo "Please only supply one file"
    else
        set prefix (date | awk '{print $3"_"$2"_"$7}')
        set filename "$prefix"_"$argv.md"
        cd $HOME/Documents/Notes/
        touch $filename
        nvim $filename
    end

end

# Function to open up notes dir in nvim
function oo
    if test  -d $HOME/Documents/Notes/ 
        cd $HOME/Documents/Notes/
        nvim ./
    else
        echo "Notes dir doesn't exist, please create it first"
        return 1
    end
end

# Function that calls yazi, and when quit automatically cd's to directory where yazi was last at
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Automatically sources venv when entering a directory that has it
function __auto_source_venv --on-variable PWD --description "Activate/Deactivate virtualenv on directory change"
  status --is-command-substitution; and return

  # Check if we are inside a git directory
  if git rev-parse --show-toplevel &>/dev/null
    set gitdir (realpath (git rev-parse --show-toplevel))
    set cwd (pwd -P)
    # While we are still inside the git directory, find the closest
    # virtualenv starting from the current directory.
    while string match "$gitdir*" "$cwd" &>/dev/null
      if test -e "$cwd/.venv/bin/activate.fish"
        source "$cwd/.venv/bin/activate.fish" &>/dev/null 
        return
      else
        set cwd (path dirname "$cwd")
      end
    end
  end
  # If virtualenv activated but we are not in a git directory, deactivate.
  if test -n "$VIRTUAL_ENV"
    deactivate
    end
end

# Starship
starship init fish | source
function fish_greeting
    pokeget random
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
