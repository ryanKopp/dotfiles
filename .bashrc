#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export XDG_CONFIG_HOME=/home/ryan/.config
export PATH="/home/ryan/.cargo/bin:$PATH"
export PATH="/home/ryan/.local/bin:$PATH"

bind -x '"\C-f":"tmux-sessionizer"'

# Stow commands
alias restow='stow -R --dir=/home/ryan/code/dotfiles --target=/home/ryan .'
alias unstow='stow -D --dir=/home/ryan/code/dotfiles .'

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -la --color=auto'
alias plexssh='ssh ryan@nekrotik.xyz'
alias rootssh='ssh root@nekrotik.xyz'
alias vim='nvim'
alias sudo='sudo '
# TODO - fix this to support wayland
alias record='ffmpeg -video_size 2560x1600 -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default output.mp4'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && yay -Syyu --noconfirm'

PS1='[\u@\h \W]\$ '

