#!/bin/bash


##########################
##   ADICIONANDO PPAs   ##
##########################
# Temas ARC
sudo add-apt-repository -y ppa:noobslab/themes

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com testing non-free | sudo tee /etc/apt/sources.list.d/spotify.list


##############################
##   INSTALANDO PROGRAMAS   ##
##############################
sudo apt-get update


pacotes=( 
    arc-theme
    build-essential
    default-jdk
    git
    htop
    python3-dev
    python3-pip
    redshift-gtk
    skype
    spotify-client
    sqliteman
    steam
    gimp
    unity-tweak-tool
    vim
    virtualbox
    xboxdrv
    zsh
)

for pkg in "${pacotes[@]}"
do
    sudo apt-get -qq install $pkg
done

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Telegram
wget https://tdesktop.com/linux
tar -xvf linux
rm linux

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Tema Spaceship do Oh My Zsh
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh

# Copiando os dotfiles
cp -rsT $(pwd)/files $HOME

