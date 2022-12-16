#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -la --color=auto'
alias plexssh='ssh -p 45743 ryan@68.132.43.58'
alias rootssh='ssh -p 45743 root@68.132.43.58'
alias lr='ssh rck018@linuxremote-csci315.bucknell.edu'
alias lrlab='ssh rck018@acet116-lnx-15.bucknell.edu'
alias cs315='cd ~/csci315/Labs/'
alias vim='nvim'
alias sudo='sudo '
alias record='ffmpeg -video_size 2560x1440 -framerate 25 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i default output.mp4'
alias buckvpn='/opt/cisco/anyconnect/bin/vpnui && ' 

PS1='[\u@\h \W]\$ '
