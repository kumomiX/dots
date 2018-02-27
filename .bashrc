#!/usr/bin/sh

# .bashrc

# autologin on tty1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi

#"\e[5~": history-search-backward
#"\e[6~": history-search-forward


export EDITOR=nvim
export VISUAL=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

(cat ~/.cache/wal/sequences &)


PS1='╰( ͡° ͜ʖ ͡° )つ──☆*: '

eval $(thefuck --alias)

alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove -R"
alias xq="xbps-query -Rs"
alias xu="sudo xbps-install -Su"

alias fishrc="r ~/.config/fish/"
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias c='fasd_cd -d'     # cd, same functionality as j in autojump
alias cc='fasd_cd -d -i' # cd with interactive selection

alias v='f -e nvim' # quick opening files with vim
alias m='f -e mpv' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open

alias music="ncmpcpp"
alias nv="nvim"
alias v="nvim"
alias r="ranger"

alias nvimrc="nvim ~/.config/nvim/init.vim"
alias conf="ranger ~/.config/"
alias pics="ranger /mnt/files/cloud/pics"
alias cloud="ranger /mnt/files/cloud/"
alias dev="ranger ~/dev/"


#cat ~/cat.txt
#exec fish

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
