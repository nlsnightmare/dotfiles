export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:.
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
    zsh-syntax-highlighting
    laravel5
    zsh-completions
)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="false"


bindkey '^ ' autosuggest-execute

HYPHEN_INSENSITIVE="true"

# Make ranger use nvim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

function y-song {
    youtube-dl -x --audio-format mp3 $1
}

function mkcd {
    if [[ $# -ne 1 ]]; then
        echo "error: no name."
        return 1
    fi

    mkdir $1 && cd $1
}

function google {
    if [[ $# -eq 0 ]]; then
        url="htpps://google.com"
    else 
        url="https://google.com/search?q=$@"
    fi

    xdg-open $url
}

alias p='yay'
alias cl='clear; neofetch'
alias vim='nvim'
alias open='xdg-open'
alias sudo='sudo -E '
alias rtheme='theme --random'
# alias dmenu='rofi -dmenu'

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
