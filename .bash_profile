#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export HISTSIZE=5000

if [ -z "$TMUX" ]  && [ -z "$SSH_TTY" ]; then
    startx
fi
