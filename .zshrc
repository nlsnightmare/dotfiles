export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.scripts/colors
export PATH=$PATH:~/.scripts/
export PATH=$PATH:~/.gem/ruby/2.5.0/bin
export PATH=$PATH:~/.config/composer/vendor/bin

ZSH_THEME="robbyrussell"
ZSH_THEME="refined"

plugins=(
    git
    command-not-found
    last-working-dir
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="false"


bindkey '^ ' autosuggest-execute

HYPHEN_INSENSITIVE="true"

# Make ranger use nvim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

function rtheme {
    wal -i `find ~/Pictures/ | sort -R | tail -1`
    col=`xrdb -query | grep color4 | tail -n1 | cut -d '#' -f2`
    killall dunst &> /dev/null
    dunst &> /dev/null &
    ~/.scripts/colors/keyboard "#$col"
    ~/.scripts/colors/strip "#$col"
    clear
    neofetch 

    notify-send "Theme Changed!"
}

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


neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
