
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/Applications/CMake.app/Contents/bin":"$PATH"
export PATH="/Users/Aral/Aral/.bin":"$PATH"
export PATH="/Users/Aral/opt/anaconda3/bin":"$PATH"
export PATH="/Users/Aral/.local/bin":"$PATH"
export PATH="/Users/Aral/.ghcup/bin":"$PATH"


# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# From Terminal Gruvbox theme: colour ls entries
export CLICOLOR=1
#
# kitty needs kitten for ssh 
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;34m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;37m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[0;33m%}%!%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%}%b '
RPROMPT='[%*]'
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '


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
#
