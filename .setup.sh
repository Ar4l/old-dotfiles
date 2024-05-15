#!/bin/bash

# setup this dotfiles dir 

if [ -d dotfiles ]; then 
	cd dotfiles 
fi 

if [[ $PWD = */dotfiles ]]; then

	git submodule init
	git submodule update --init --recursive 

	mv dotfiles/* ../
	mv dotfiles/.* ../

	if ! which apt-get > /dev/null; then 
		apt-get update 
		apt-get install vim 
	fi

fi
