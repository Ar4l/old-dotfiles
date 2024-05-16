#!/bin/bash

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# MACOS-SPECIFIC: fix git prompt 
# https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]; then 
	source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
else 
	source ~/.bash_git
fi 


# PROMPT
function cur_git_branch() {

  if ! command -v __git_ps1 &> /dev/null  # first check if the command exists 
    then printf "\e[33mx \e[0m"          # then print (x) in dark orange text 

  else 
    branch=$(__git_ps1 '%s ')
    printf "\e[33;1m${branch}\e[0m"         # branch in dark yellow bold text
  fi
}

function cur_conda_env() {

  # if [ -z "$CONDA_DEFAULT_ENV" ]    # if no conda env is set, 
  #   then printf "\e[35mx \e[0m"     # put an x in dark purple text
  # elif

  if [ ! -z "$CONDA_DEFAULT_ENV" ]
    then printf "\e[95;1m$CONDA_DEFAULT_ENV \e[0m"  # active conda env in light purple bold text
  fi
}

PROMPT_COMMAND='
  GIT_PROMPT=$(cur_git_branch)
  CONDA_PROMPT=$(cur_conda_env)
'
PS1='\n${CONDA_PROMPT}${GIT_PROMPT}\[\e[0;37m\]\u@\h:\[\e[90m\]\W\[\e[37m\] \011(\t)\n\[\e[35;1m\]\$\[\e[0m\] '

# always start terminal at the bottom, please.
printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

