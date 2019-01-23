export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.scripts/colors
export PATH=$PATH:~/.scripts/
export PATH=$PATH:~/.gem/ruby/2.6.0/bin
export PATH=$PATH:~/.config/composer/vendor/bin

ZSH_THEME="robbyrussell"
ZSH_THEME="refined"

plugins=(
    git
    command-not-found
    last-working-dir
    zsh-autosuggestions
    laravel5
)

source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="false"


bindkey '^ ' autosuggest-execute

HYPHEN_INSENSITIVE="true"

# Make ranger use nvim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

function ins {
    pacaur -S $(pacaur -Ssq $1 | fzf)
}

function y-song {
    youtube-dl -x --audio-format mp3 $1
}

alias p='pacaur'
alias cl='clear; neofetch'
alias vim='nvim'
alias open='xdg-open'
alias sudo='sudo -E '


neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
