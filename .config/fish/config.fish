function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

alias install="sudo pacman -S"
alias uninstall="sudo pacman -Rns"
alias music="ncmpcpp"
alias l="ls -al"
alias r="ranger"
alias v="vim"
alias mp3="youtube-dl --extract-audio --audio-format mp3 -o \"%(title)s.%(ext)s\""
alias viv="vim /opt/vivaldi/resources/vivaldi/style/custom.css"

alias sh="r ~/.config/fish/"

alias conf="r ~/.config/"
alias pics="r /media/windows/cloud/pics"
alias cloud="r /media/windows/cloud/"
alias dev="r ~/dev/"

#set -x LC_ALL en_US.UTF-8
#set -x LC_CTYPE en_US.UTF-8

## Start X at login
#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec startx -- -keeptty
#    end
#end
