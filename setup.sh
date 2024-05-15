#!/bin/bash

# setup this dotfiles dir 

if [ -d dotfiles ]; then 
	cd dotfiles 
fi 

if [[ $PWD = */dotfiles ]]; then

	# make this file delete itself to not clutter the home directory
	# setups are one-off 
	rm setup.sh

	# git submodule init
	# git submodule update --init --recursive 

	mv * ../
	mv .* ../

	cd ..

	if which apt-get > /dev/null; then 
		yes | apt-get update 
		yes | apt-get install vim 
	fi

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	rm -r dotfiles

	# open a new shell
	exec bash
fi
