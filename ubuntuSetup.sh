#####################
##   ADDING PPAs   ##
#####################
# ARC Themes
sudo add-apt-repository -y ppa:noobslab/themes

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com testing non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb http://apt.syncthing.net/ syncthing release" | sudo tee /etc/apt/sources.list.d/syncthing.list

#############################
##   INSTALLING PROGRAMS   ##
#############################
sudo apt-get update
sudo apt-get -yq upgrade

pacotes=( 
    arc-theme
    build-essential
    cmake
    default-jdk
    gimp
    git
    htop
    pandoc
    python-dev
    python3-dev
    python3-pip
    ranger
    redshift-gtk
    spotify-client
    sqliteman
    steam
    syncthing
    texlive-full
    texlive-latex-extra
    texstudio
    tmux
    unity-tweak-tool
    vim-gtk3
    virtualbox
    xboxdrv
    zsh
)

for pkg in "${pacotes[@]}"
do
    sudo apt-get -yq install $pkg
done

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Telegram
wget https://tdesktop.com/linux
tar -xvf linux
rm linux

# Change default shell
chsh -s $(which zsh)

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Spaceship Theme for Oh My Zsh
curl -o - https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/install.sh | zsh

# Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copying dotfiles over
git clone https://github.com/GFlorio/dotfiles.git $HOME/.dotfiles
cp -rfsT $HOME/.dotfiles/files/link $HOME
cp -rfT $HOME/.dotfiles/files/copy $HOME

# Creating Vim dirs
mkdir -p $HOME/.vim/backups
mkdir -p $HOME/.vim/swap

# Installing vim plugins...
vim -E -c PlugInstall -c q

# And compiling YouCompleteMe with basic c-like and Python support
cd ~/.vim/plugged/youcompleteme
./install.py --clang-completer
cd --
