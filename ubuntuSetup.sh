#############################
##   INSTALLING PROGRAMS   ##
#############################
sudo apt-get update
sudo apt-get -yq upgrade

packages=( 
    build-essential
    cmake
    curl
    default-jdk
    git
    htop
    python-dev
    python3-dev
    python3-pip
    tmux
    vim-gtk3
    xclip
)

for pkg in "${packages[@]}"
do
    sudo apt -yq install $pkg
done

snaps=(
    chromium
    telegram-desktop
)

# Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copying dotfiles over
#git clone https://github.com/GFlorio/dotfiles.git $HOME/.dotfiles
cp -rfsT $HOME/.dotfiles/files/link $HOME
cp -rfT $HOME/.dotfiles/files/copy $HOME
wget -O $HOME/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Creating Vim dirs
mkdir -p $HOME/.vim/backups
mkdir -p $HOME/.vim/swap

# Installing vim plugins...
vim -E -c PlugInstall -c q

# And compiling YouCompleteMe with basic c-like and Python support
cd ~/.vim/plugged/youcompleteme
./install.py --clang-completer
cd --
