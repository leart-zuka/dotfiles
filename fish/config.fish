alias ls='ls --color=auto'
alias ff='firefox'
alias e='exit'
alias cd..='cd ..'
alias black='~/.local/bin/black .'
alias gg='git pull'
alias gf='git fetch'
alias gc='git checkout'
alias gs='git status'
alias lg='lazygit'
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

pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
starship init fish | source
fnm env --use-on-cd | source
function fish_greeting
end
