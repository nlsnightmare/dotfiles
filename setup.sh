#!/bin/bash
pushd ~ > /dev/null


title="Install Script"

# Install pacaur for AUR
sudo pacman -S pacaur --needed 

notify-send "$title" "Installed pacaur"

# Update the system packages
pacaur -Syu # Update

notify-send "$title" "Updated packages!"

export install_targets=(
        # Windows manager
        i3-gaps

        # Editors
        neovim             # NeoVim
        xclip
        emacs            # Emacs

        # Theaming
        neofetch           # Display system info on terminal
        rxvt-unicode       # Terminal emulator
        zsh                # Zsh shell
        feh                # Change desktop background
        rofi               # Application launcher
        ttf-font-awesome   # Icons for workspaces and more
        cava               # Terminal-based visualizer
        playerctl          # Controll music from the terminal
        cmus               # CLI music player
        w3m                # Display images on terminal
        numlockx           # Enable nums lock on startup
        polybar            # Better status bar
        arduino            # Arduino
        python-pywal       # Generate colorscheme from images
        notify-send        # Create notifications
        compton            # Transparency and more

    	# Keyboard
        openrazer-meta     # Needed for Razer Keyboard Color control
        razercommander-git # Needed for Razer Keyboard Color control
        linux-headers      # Needed for Razer Keyboard Color control

        hsetroot           # Tile, tint wallpapers & more

        # Programming
        rustup             # Rustlang
        nodejs
        npm
        composer

        # Services
        systemctl
        mariadb
        apache

        # Ruby
        ruby              
        ruby-docs
        ruby-rdoc

        clang
        cmake 

        # Misc
        youtube-dl-git   # Download from youtube
        sl               # Yay! trains!
        tree             # Shows a tree of things
        ranger-git       # CLI file browser
        krita            # Image editor
)

pacaur -S ${install_targets[*]} --noconfirm --noedit --needed


notify-send "$title" "pacaur finished installing packages!"

systemctl enable mariadb.service
systemctl start  mariadb.service

systemctl enable httpd.service
systemctl start  httpd.service

composer global require laravel/installer


# Make git remember crendentials for one hour
git config --global credential.helper 'cache --timeout=3600'


# Allow user access to arduino etc.
sudo gpasswd -a $USER uucp
sudo gpasswd -a $USER lock
sudo gpasswd -a $USER input
sudo gpasswd -a $USER plugdev

rustup install stable
rustup default stable
rustup toolchain install nightly
rustup component add rust-src
cargo install racer

notify-send "$title" "Rust installed!"

# Javascript autocompletion
sudo npm i -g ternjs
sudo npm i -g live-server


notify-send "$title" "npm packages installed!"

# Needed for python autocompletion
sudo pip install jedi autopep8 flake8 yapf

# Needed for neovim python support
sudo pip install pynvim

# Needed for arduino coms
sudo pip install pyserial

notify-send "$title" "pip packages installed!"

# Install jekyll
gem update
gem install jekyll bundler

notify-send "$title" "Jekyll installed!"


# requires user input
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

if [[ ! -f ~/.vim/bunfle/Vundle.vim ]]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [[ ! -d ~/.emacs.d ]]; then
    mkdir ~/Documents/Agenda
    git clone https://github.com/nlsnightmare/.emacs.d
    rm ~/.emacs
fi

# restore last dir
popd > /dev/null
