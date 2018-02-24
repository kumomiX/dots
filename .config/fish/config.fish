function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

set pure_symbol_prompt "╰( ͡° ͜ʖ ͡° )つ──☆*:・"

function yank_fasd -d "yank with fasd"
  command cp (fasd -f $argv[1]) (fasd -d $argv[2])
end

#function fish_user_key_bindings
#  # ...
#  bind \e\e 'fuck'  # Bind EscEsc to thefuck
#  # ...
#end

alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove"
alias xq="xbps-query -Rs"

alias fishrc="r ~/.config/fish/"
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"

alias c='fasd_cd -d'
alias vi='f -e nvim'
alias ra='d -e ranger'
alias m='f -e mpv'
alias y='yank_fasd'

alias music="ncmpcpp"
alias nv="nvim"
alias v="nvim"
alias r="ranger"

alias nvimrc="nvim ~/.config/nvim/init.vim"
alias conf="ranger ~/.config/"
alias pics="ranger /mnt/files/cloud/pics"
alias cloud="ranger /mnt/files/cloud/"
alias dev="ranger ~/dev/"

#set -x PATH $PATH $HOME"/.config/yarn/global/node_modules/.bin"
#set -x LC_ALL en_US.UTF-8
#set -x LC_CTYPE en_US.UTF-8

## Start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#end
