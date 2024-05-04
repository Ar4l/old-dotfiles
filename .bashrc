# MACOS-SPECIFIC: fix git prompt 
# https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

function cur_git_branch() {
  # branch in dark yellow bold text
  branch=$(__git_ps1 '%s ')
  printf "\e[33;1m${branch}\e[0m"
}

function cur_conda_env() {
  # active conda env in light purple bold text
  if [ ! -z "$CONDA_DEFAULT_ENV" ]
    then printf "\e[95;1m$CONDA_DEFAULT_ENV \e[0m"
  fi
}

PROMPT_COMMAND='
  GIT_PROMPT=$(cur_git_branch)
  CONDA_PROMPT=$(cur_conda_env)
'

PS1='
${CONDA_PROMPT}${GIT_PROMPT}\[\e[0;37m\]\u@\h:\[\e[90m\]\W\[\e[37m\] \011(\t)\n\[\e[35;1m\]\$\[\e[0m\] '

# always start terminal at the bottom, please.
printf "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

