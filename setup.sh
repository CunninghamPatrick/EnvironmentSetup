#!/bin/bash

if [ -e ~/.bashrc ]; then
	mv ~/.bashrc ~/.bashrc.old
fi
cp ./bashrc ~/.bashrc

if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.old
fi
cp ./vimrc ~/.vimrc

if [ -d ~/.vim ]; then
	mv ~/.vim ~/.vim.old
fi
cp -r ./vim ~/.vim

if [ -e ~/.bash_aliases ]; then
	mv ~/.bash_aliases ~/.bash_aliases.old
fi
cp ./bash_aliases ~/.bash_aliases

if [ -e ~/.dircolors ]; then
	mv ~/.dircolors ~/.dircolors.old
fi
cp ./dircolors ~/.dircolors

if [ -d ~/.ssh ]; then
	mv ~/.ssh ~/.ssh.old
fi

if [ -e ~/.tmux.conf ]; then
	mv ~/.tmux.conf ~/.tmux.conf.old
fi
cp ./tmux.conf ~/.tmux.conf

ssh-keygen
read -p 'username for purdue: ' user
read -p 'hostname for purdue: ' host
ssh-copy-id $user@$host
sed -i "s/PURDUEUSER/$user/g" ~/.bash_aliases
sed -i "s/PURDUEHOST/$host/g" ~/.bash_aliases

read -p 'username for home: ' user
read -p 'hostname for home: ' host
ssh-copy-id -p 5273 $user@$host
sed -i "s/HOMEUSER/$user/g" ~/.bash_aliases
sed -i "s/HOMEHOST/$host/g" ~/.bash_aliases

source ~/.bashrc

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install all plugins
vim -c 'PluginInstall' -c 'qa!'

# Install python (needed to compile YouCompleteMe
sudo apt-get install -y python-dev cmake g++ build-essential

# Run YouCompleteMe install.py
python ~/.vim/bundle/YouCompleteMe/install.py 

