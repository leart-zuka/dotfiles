alias ls='ls --color=auto'
alias ff='firefox'
alias e="exit"
alias cd..="cd .."
alias black="~/.local/bin/black ."
alias gg="git pull"
alias gf="git fetch"
alias gc="git checkout"
alias gs="git status"
alias cl="clear"
alias activate="source .venv/bin/activate.fish"
alias pytest="python -m pytest"
alias sps="sudo pacman -S"
alias spy="sudo pacman -Syu"
alias emacs="devour emacsclient -c -a 'emacs'"
alias bornagain=.~/born_again_build_dirs/bornagain/build/bin/bornagain

pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
starship init fish | source

function fish_greeting
end
