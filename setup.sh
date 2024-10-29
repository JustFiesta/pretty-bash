#!/usr/bin/env bash
# -----------------
# This script reqiures: git, wget, curl, and YouCompleteMe dependencies
# If there is any problem with YCM install it via ~/.vim/plugged/YouCompleteMe/install.py

# Make a tmp folder for download files
echo ""
echo "Creating /tmp/pretty-bash-tmp/ folder for download files"
mkdir /tmp/pretty-bash-tmp/ && cd /tmp/pretty-bash-tmp/

# Download needed config files

echo "---------------------------------------------"
echo ""
echo "Using wget to download .bashrc arhive..."
echo ""
wget https://github.com/JustFiesta/pretty-bash/archive/main.zip

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not wget .bashrc arhive from GitHub."
	exit 1
fi

echo ""
echo "Unpacking zip file..."
echo ""
unzip main.zip

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not unzip main.zip arhive."
	exit 1
fi

echo ""
echo "Installing new .bashrc..."
cd pretty-bash-main/ && mv .bashrc ~/.bashrc && cd ..

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not move new .bashrc file into HOME directory."
	exit 1
fi

echo ""
echo "File succesfully installed! ($HOME/.bashrc)"
echo ""

echo "---------------------------------------------"
echo ""
echo "Using wget to download .vimrc zip arhive..."
echo ""
wget https://github.com/JustFiesta/Basic-vim/archive/master.zip

if [ $? -eq 1 ]; then
        echo "Could not wget .vimrc zip archive from GitHub."
        exit 1
fi 

echo ""
echo "Unpacking zip file..."
echo ""
unzip master.zip

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not unzip main.zip arhive."
	exit 1
fi

echo ""
echo "Installing new .bashrc..."
echo ""
cd Basic-vim-master/ && mv .vimrc ~/.vimrc

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not move new .vimrc file into HOME directory."
	exit 1
fi

echo ""
echo "File succesfully installed! ($HOME/.vimrc)"

echo ""
echo "Removing tmp/pretty-bash-tmp/"
rm -r /tmp/pretty-bash-tmp/

if [ $? -eq 1 ]; then
	echo ""
	echo "Could not remove tmp folder. Please proceed manually."
	exit 1
fi

# Download VIM plugin manager

echo ""
echo "---------------------------------------------"
echo ""

# Create folders
echo "Creating .vim folder..."
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

if [ $? -eq 1 ]; then
	echo ""
        echo "Could not create .vim folder."
        exit 1
fi


# Download vim-plug
echo ""
echo "---------------------------------------------"
echo ""
echo "Using curl to download vim-plug (plugin manager)..."
echo ""
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ $? -eq 1 ]; then
	echo ""
        echo "Could not download vim-plug plugin manager."
        exit 1
fi
echo ""
echo "vim-plug installed!"


# Install VIM plugins

echo ""
echo "---------------------------------------------"
echo "Installing VIM plugins..."
vim +PlugInstall +qall

if [ $? -eq 1 ]; then
	echo ""
	echo "Error during plugin installation. Please install them manuanlly in vim using :PlugInstall"
        exit 1
fi

echo ""
echo "VIM plugins installed!"

# Reload configfiles 
echo "---------------------------------------------"
echo ""
echo "Reloading configuration files..."
echo ""
source $HOME/.bashrc
echo ""
source $HOME/.vimrc
echo ""
echo "---------------------------------------------"
