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


# Kitty needs a kitten for proper $TERM detection on ssh 
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Set KITTY_PORT env variable
if [[ $SSH_TTY ]] && ! [ -n "$TMUX" ]; then
  export KITTY_PORT=`kitty @ ls 2>/dev/null | grep "[0-9]:/tmp/mykitty" | head -n 1 | cut -d : -f 1 | cut -d \" -f 2`
fi 

# only if in TTY (interactive) set bindings
if [[ "$-" = *i* ]] && [ -t 1 ]; then 
  # Kitty Terminal Navigation
  bind -x '"\C-h": kitty @ kitten neighboring_window.py left'
  bind -x '"\C-j": kitty @ kitten neighboring_window.py top'
  bind -x '"\C-k": kitty @ kitten neighboring_window.py bottom'
  bind -x '"\C-l": kitty @ kitten neighboring_window.py right' 

  bind '"\e[1;3D" backward-word'
  bind '"\e[1;3C" forward-word'

  # Source kitty binary
  export PATH=$PATH:~/.local/kitty.app/bin/
fi

source /Users/Aral/anaconda3/bin/activate

