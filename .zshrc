export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.scripts/colors
ZSH_THEME="robbyrussell"
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="false"


bindkey '^ ' autosuggest-execute

HYPHEN_INSENSITIVE="true"

# Make ranger use vim
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

alias p='pacaur'
alias cl='clear; neofetch'


neofetch
