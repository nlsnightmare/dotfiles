export ZSH=$HOME/.oh-my-zsh
# export PATH=$PATH:~/fvm/default/bin
export PATH=$PATH:.
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.scripts/colors
export PATH=$PATH:~/.scripts/
export PATH=$PATH:~/.gem/ruby/2.7.0/bin
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:~/.config/composer/vendor/bin
# export PATH=$PATH:/opt/flutter/bin
export PATH=$PATH:~/.dotnet/tools

export NOTES=~/Documents/notes
export WORK_DIRECTORY=~/Documents/work
export XDG_CONFIG_HOME=~/.config
export FVM_CACHE_PATH=~/fvm/default/bin


# Install possibly missing zsh plugins
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions ]]; then
  git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
fi


if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi



# Android stuff
export ANDROID_SDK_ROOT="/home/maru/Android/Sdk"
export ANDROID_HOME="/home/maru/Android/Sdk"
export CAPACITOR_ANDROID_STUDIO_PATH="/usr/bin/android-studio"

# export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))
export DOTNET_ENVIRONMENT=Development

# see https://github.com/dotnet/aspnetcore/issues/38798
export DOTNET_WATCH_RESTART_ON_RUDE_EDIT=1
export CHROME_EXECUTABLE=google-chrome-stable
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export HISTFILESIZE=100000

# force typescirpt to use fs events, should result in
# lower idle cpu usage
export TSC_WATCHFILE=UseFsEventsWithFallbackDynamicPolling

ZSH_THEME="robbyrussell"
# ZSH_THEME=wedisagree
# ZSH_THEME="refined"

plugins=(
    git
    colored-man-pages
    command-not-found
    last-working-dir
    zsh-autosuggestions
    zsh-syntax-highlighting
    # ripgrep
    zsh-completions
)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="false"


bindkey '^ ' autosuggest-execute

HYPHEN_INSENSITIVE="true"

# Make ranger use nvim
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR

function ysong {
	yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 $@
}

function config {
	if [[ ! -z $1 ]]; then
		selected="$XDG_CONFIG_HOME/$1"
		if [[ -d $selected ]]; then
			cd $selected
			return
		else
			echo "Config folder '$1' does not exist."
			return
		fi

	fi
	selected=`fd --type directory --max-depth 1 --base-directory $XDG_CONFIG_HOME | fzf --prompt='Select a Project: '`

	if [[ -z $selected ]]; then
		return
	fi

	cd $XDG_CONFIG_HOME/$selected

}

function project {
	if [[ ! -z $1 ]]; then
		selected="$WORK_DIRECTORY/$1"
		if [[ -d $selected ]]; then
			cd $selected
			return
		else
			echo "Project '$1' does not exist."
			return
		fi

	fi
	selected=`fd --type directory --max-depth 1 --base-directory $WORK_DIRECTORY | fzf --prompt='Select a Project: '`

	if [[ -z $selected ]]; then
		return
	fi

	cd $WORK_DIRECTORY/$selected
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


function cluster {
	selected=`kubectl config get-contexts -o name| fzf --prompt='Select a Cluster: '`
	kubectl config use-context $selected
	echo "using $selected"
}

function kubessh {
    namespace=$2
    if [[ -z $2 ]]; then
        namespace='default'
    fi

    kubectl -n $namespace exec -ti deploy/$1 -- bash
}

function note {
	if [ -z "$@" ]; then
		echo "Usage: note [notes to save]"
		return 1;
	fi

    echo "$@" >> $NOTES
}

function notes {
    if [ -f $NOTES ]; then
        less -n20 $NOTES
    else
        echo "Notes are empty"
    fi
}

function editnotes {
	$EDITOR $NOTES
}

function clearnotes {
    rm $NOTES
}

alias p='paru'
alias df='dysk'
alias stopred='systemctl --user stop redshift.service'
alias cl='clear; fastfetch'
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
alias gP='git pull';
alias k8='kubectl'
alias k8-proxy='xdg-open "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default" & kubectl proxy'
alias a='php artisan'
alias tinker='php artisan tinker'
alias ls='lsd'
alias j='just'
alias dn='dotnet'
alias e64='base64'
alias d64='base64 -d'
alias grep='rg'
alias ra='ranger'
alias c='code .'
alias xclip='xclip -selection clipboard'
alias proj='project'
alias conf='config'
alias techcom='kubectl exec -ti deployment/bc-social-alpha -- php artisan techcom'

# fastfetch

if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
else
	echo "Generating fzf zsh completions..."
 fzf --zsh > ~/.fzf.zsh
fi

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc


# too slow
# source /usr/share/nvm/init-nvm.sh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/maru/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/maru/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
