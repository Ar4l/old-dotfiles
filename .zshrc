# From Terminal Gruvbox theme: colour ls entries
export CLICOLOR=1

# fucking conda being conda
alias python=python3
alias pip=pip3
export CONDA_AUTO_ACTIVATE_BASE=false

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"
export PATH="/Users/Aral/Aral/.bin":"$PATH"
export PATH="/Users/Aral/opt/anaconda3/bin":"$PATH"
export PATH="/Users/Aral/.local/bin":"$PATH"
export PATH="/Users/Aral/.ghcup/bin":"$PATH"

# export PYTHONPATH="/Users/Aral/Aral/.bin":"$PYTHONPATH"

# Application shorthands
export vs="Visual Studio Code"
export ij="IntelliJ IDEA"

# Path shorthands
export research="/Users/Aral/Aral/Delft/YEAR 4"
export rp="/Users/Aral/Aral/Delft/YEAR 3/0 RESEARCH PROJECT/LLM4CodeCompression"

export ml="/Users/Aral/Desktop/Music Library"
export brain="/Users/Aral/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain 2.0"
export dev='/Users/Aral/Aral/Dev'


# Command Shorthands 
function mkd() {
    mkdir $1
    cd $1
}

function cl() {
    cd $1
    ls -laht
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Aral/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Aral/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Aral/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Aral/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


