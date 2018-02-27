function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

set pure_symbol_prompt "╰( ͡° ͜ʖ ͡° )つ──☆*:・"


#function fish_user_key_bindings
#  # ...
#  bind \e\e 'fuck'  # Bind EscEsc to thefuck
#  # ...
#end


#set -x EDITOR=nvim
#set -x VISUAL=nvim
cat ~/.cache/wal/sequences &

alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove -R"
alias xq="xbps-query -Rs"
alias xu="sudo xbps-install -Su"

alias fishrc="r ~/.config/fish/"
alias bspwmrc="vim ~/.config/bspwm/bspwmrc"

alias c='fasd_cd -d'
alias v="f -e $EDITOR" # quick opening files with vim
alias o='a -e open_command' # quick opening files with xdg-open
alias r='d -e ranger'
alias m='f -e mpv'

alias music="ncmpcpp"
alias nv="$EDITOR"
alias vi="$EDITOR"
alias snv="sudo $EDITOR"
alias svi="sudo $EDITOR"
alias r="ranger"
alias sr="sudo ranger"

alias nvimrc="nvim ~/.config/nvim/init.vim"
alias conf="ranger ~/.config/"
alias pics="ranger /mnt/files/cloud/pics"
alias cloud="ranger /mnt/files/cloud/"
alias dev="ranger ~/dev/"

#set -x PATH $PATH ~/.config/scripts/
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

## Start X at login
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end
