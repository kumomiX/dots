function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

<<<<<<< HEAD

alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove"
=======
set focus_color (xrdb -query | grep 'color7' | cut -f2)
set bg_color (xrdb -query | grep 'background' | cut -f2)
set fg_color (xrdb -query | grep 'foreground' | cut -f2)

alias install="sudo pacman -S"
alias uninstall="sudo pacman -Rns"
>>>>>>> 3d64bd84e3045a09d97a0bdba6c8c91788e1f08c
alias music="ncmpcpp"
alias l="ls -al"
alias r="ranger"
alias v="vim"
alias mp3="youtube-dl --extract-audio --audio-format mp3 -o \"%(title)s.%(ext)s\""
alias viv="vim /opt/vivaldi/resources/vivaldi/style/custom.css"

<<<<<<< HEAD
alias shell="r ~/.config/fish/"
=======
alias sh="r ~/.config/fish/"
>>>>>>> 3d64bd84e3045a09d97a0bdba6c8c91788e1f08c

alias conf="r ~/.config/"
alias pics="r /media/windows/cloud/pics"
alias cloud="r /media/windows/cloud/"
alias dev="r ~/dev/"

<<<<<<< HEAD
set -x PATH $PATH $HOME"/.config/yarn/global/node_modules/.bin"
=======
>>>>>>> 3d64bd84e3045a09d97a0bdba6c8c91788e1f08c
#set -x LC_ALL en_US.UTF-8
#set -x LC_CTYPE en_US.UTF-8

## Start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#end
