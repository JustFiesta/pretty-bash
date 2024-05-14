#!/usr/bin/env bash
# -----------------
# This script reqiures: git, wget, curl, and YouCompleteMe dependencies
# If there is any problem with YCM install it via ~/.vim/plugged/YouCompleteMe/install.py

# Download needed config files

echo "Using wget to download .bashrc config file..."
wget -P $HOME -O .bashrc https://raw.githubusercontent.com/JustFiesta/Pretty-Bash/main/.bashrc

if [ $? -eq 1 ]; then
	echo "Could not wget .bashrc from GitHub."
	exit 1
fi
echo "File fetched! ($HOME/.bashrc)"

echo "Using wget to download .vimrc config file..."
wget -P $HOME -O .vimrc https://raw.githubusercontent.com/JustFiesta/Basic-vim/master/.vimrc

if [ $? -eq 1 ]; then
        echo "Could not wget .vimrc from GitHub."
        exit 1
fi 
echo "File fetched! ($HOME/.vimrc)"


# Download VIM plugin manager

# Create folders
echo "Creating .vim folder..."
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

if [ $? -eq 1 ]; then
        echo "Could not create .vim folder."
        exit 1
fi

# Download vim-plug
echo "Using curl to download vim-plug (plugin manager)..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ $? -eq 1 ]; then
        echo "Could not download vim-plug plugin manager."
        exit 1
fi
echo "vim-plug installed!"


# Reload configfiles 
source $HOME/.bashrc
source $HOME/.vimrc

# Install VIM plugins
echo "Installing VIM plugins..."
vim +PlugInstall +qall

if [ $? -eq 1 ]; then
	echo "Error during plugin installation. Please install them manuanlly in vim using :PlugInstall"
        exit 1
fi
echo "VIM plugins installed!"