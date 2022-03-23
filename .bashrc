#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# sus
alias sus='systemctl suspend'

# xclip clipboard
alias clip='xclip -selection clipboard'

# copy lastpass password to clipboard
alias cliplp='cat ~/.lasspass | clip'

# lolth
alias lolth='ssh caleb.barger@lolth.ccb'

alias ll='ls -al'
PS1='[\u@\h \W]\$ '
