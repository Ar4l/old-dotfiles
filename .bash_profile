
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Aral/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

# If there exists an executable tmux on daic, then set this accordingly
if [ -x '/home/nfs/addemoor/local/bin/tmux' ]; then
	export PATH=/home/nfs/addemoor/local/bin:$PATH
	export TERM=xterm-256color
fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

