#!/bin/bash

# setup this dotfiles dir 

if [ -d dotfiles ]; then 
	cd dotfiles 
fi 

if [[ $PWD = */dotfiles ]]; then

	# make this file delete itself to not clutter the home directory
	# setups are one-off 
	rm setup.sh
 	# similarly, let's not make every sub-directory be implicitly tracked by git
 	rm -rf .git

	# git submodule init
	# git submodule update --init --recursive 

	yes no | mv * ../
	yes no | mv .* ../

	cd ..

	if which apt-get > /dev/null; then 

		if [ "$EUID" -ne 0 ]; then 
			echo 'not a root user'
		else # requires root 
			yes | apt-get update 
			yes | apt-get install vim 
		fi

		curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

		# git lfs 
		curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
		yes | apt-get install git-lfs 
	fi

	# vim plugins
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# update tmux 
	tmux source-file ~/.tmux.conf
 
	rm -rf dotfiles

	# open a new shell
	exec bash
fi
