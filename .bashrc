# MACOS-SPECIFIC: fix git prompt 
# https://stackoverflow.com/questions/12870928/mac-bash-git-ps1-command-not-found
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "%s ")'; PS1='\n\[\e[33;1m\]${PS1_CMD1}\[\e[0;37m\]\u@\h:\[\e[90m\]\W\[\e[37m\] \011(\t)\n\[\e[35;1m\]\$\[\e[0m\] '
