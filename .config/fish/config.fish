function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end


alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove"

alias shell="r ~/.config/fish/"
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"

alias music="ncmpcpp"
alias v="nvim"
alias r="ranger"
alias conf="r ~/.config/"
alias pics="r /media/windows/cloud/pics"
alias cloud="r /media/windows/cloud/"
alias dev="r ~/dev/"

set -x PATH $PATH $HOME"/.config/yarn/global/node_modules/.bin"
#set -x LC_ALL en_US.UTF-8
#set -x LC_CTYPE en_US.UTF-8

## Start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#end
