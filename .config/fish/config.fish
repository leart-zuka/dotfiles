alias ls='ls --color=auto'
alias ff='firefox'
alias e='exit'
alias cd..='cd ..'
alias black='~/.local/bin/black .'
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

function ggg
  git add .
  git commit -m $argv
  git push
end

# pyenv init - | source
# status --is-interactive; and pyenv virtualenv-init - | source
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

starship init fish | source
function fish_greeting
    pokeget random
end
