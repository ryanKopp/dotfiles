#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export HISTSIZE=5000

if [ -z "$TMUX" ]; then
    startx
fi
