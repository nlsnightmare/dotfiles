export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.scripts/colors
export PATH=$PATH:~/.gem/ruby/2.5.0/bin
ZSH_THEME="robbyrussell"

plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="false"


bindkey '^ ' autosuggest-execute

HYPHEN_INSENSITIVE="true"

# Make ranger use nvim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

function rtheme {
    wal -i `find ~/Pictures/new | sort -R | tail -1`
}

alias p='pacaur'
alias cl='clear; neofetch'
alias vim='nvim'


neofetch
