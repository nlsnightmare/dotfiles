#!/bin/bash
pushd ~ > /dev/null

# Allow user access to arduino etc.
sudo gpasswd -a $USER uucp
sudo gpasswd -a $USER lock
sudo gpasswd -a $USER input
sudo gpasswd -a $USER plugdev



# Install pacaur for AUR
sudo pacman -S pacaur --needed 

# Update the system packages
pacaur -Syu # Update


export install_targets=(
        # Editors
        vim              # Vim Editor
        emacs            # Editor

        # Theaming
        neofetch         # Display system info on terminal
        rxvt-unicode     # Terminal emulator
        zsh              # Zsh shell
        feh              # Change desktop background
        rofi             # Application launcher
        ttf-font-awesome # Icons for workspaces and more
        cava             # Terminal-based visualizer
        playerctl        # Controll music from the terminal
        cmus             # CLI music player
        w3m              # Display images on terminal
        numlockx         # Enable nums lock on startup
        polybar          # Better status bar
        arduino          # Arduino
        python-pywal     # Generate colorscheme from images
        hsetroot         # Tile, tint wallpapers & more

        # Programming
        ruby
        ruby-rdoc        # Needed for gems
        rustup           # Rustlang
        nodejs
        npm


        # Misc
        youtube-dl-git   # Download from youtube
        sl               # Yay! trains!
        tree             # Shows a tree of things
        ranger-git       # CLI file browser
)

pacaur -S ${install_targets[*]} --noconfirm --noedit --needed

rustup install stable
rustup default stable
rustup toolchain install nightly
rustup component add rust-src
cargo install racer


# Javascript autocompletion
sudo npm i -g tern

# Needed for python autocompletion
sudo pip install jedi autopep8 flake8 yapf

# Needed for arduino coms
sudo pip install pyserial

# Install jekyll
gem install jekyll bundler




# requires user input
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d ~/.emacs.d ]]; then
    git clone https://github.com/nlsnightamare/.emacs.d
    rm ~/.emacs
fi
uopd > /dev/null
