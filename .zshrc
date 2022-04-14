export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:.
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.scripts/colors
export PATH=$PATH:~/.scripts/
export PATH=$PATH:~/.gem/ruby/2.7.0/bin
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:~/.config/composer/vendor/bin
export PATH=$PATH:/opt/flutter/bin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))
export CHROME_EXECUTABLE=google-chrome-stable
# Required to start xdebug from vscode
export XDEBUG_CONFIG="idekey=VSCODE"
export NOTES=~/Documents/notes

export HISTSIZE=100000
export HISTFILESIZE=100000

# force typescirpt to use fs events, should result in
# lower idle cpu usage
export TSC_WATCHFILE=UseFsEventsWithFallbackDynamicPolling

ZSH_THEME="robbyrussell"
ZSH_THEME="refined"

plugins=(
    git
    colored-man-pages
    command-not-found
    last-working-dir
    zsh-autosuggestions
    zsh-syntax-highlighting
    laravel5
    ripgrep
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

    mkdir -p $1 && cd $1
}

function google {
    xdg-open "https://google.com/search?q=$@"
}

function kubessh {
    namespace=$2
    if [[ -z $2 ]]; then
        namespace='default'
    fi

    kubectl -n $namespace exec -ti deploy/$1 -- bash
}

function note {
    echo "$@" >> $NOTES
}

function notes {
    if [ -f $NOTES ]; then
        less -n20 $NOTES
    else
        echo "Notes are empty"
    fi
}

function clearnotes {
    rm $NOTES
}

alias p='pacaur --noedit'
alias cl='clear; neofetch'
alias vim='nvim'
alias v='nvim'
alias ve='nvim /tmp/$(uuidgen)'
alias sv='sudo nvim'
alias open='xdg-open'
alias sudo='sudo -E '
alias rtheme='theme --random'
alias starwars='telnet towel.blinkenlights.nl'
alias pf='php artisan test --filter'
alias gs='git status'
alias k8='kubectl'
alias k8-proxy='xdg-open "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default" & kubectl proxy'
alias ace='node ace'
alias artisan='php artisan'
alias tinker='php artisan tinker'
alias ls='lsd'
alias e64='base64'
alias d64='base64 -d'
alias grep='rg'
alias ra='ranger'
alias c='code .'
alias xclip='xclip -selection clipboard'

neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /etc/profile.d/jre.sh ] && source /etc/profile.d/jre.sh
