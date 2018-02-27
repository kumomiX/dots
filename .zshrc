#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

[ -z "${DISPLAY}" ] && [ -n "${XDG_VTNR}" ] && [ "${XDG_VTNR}" -eq 1 ] && exec startx

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi



stty -ixon
export ZBEEP='\eg'
export LANG=en_US.UTF-8

export EDITOR=nvim
export VISUAL=nvim

#(cat ~/.cache/wal/sequences &)

setopt AUTO_CD

#PROMPT='╰( ͡° ͜ʖ ͡° )つ──☆*: '

eval $(thefuck --alias)

alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove -R"
alias xq="xbps-query -Rs"
alias xu="sudo xbps-install -Su"

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias c='fasd_cd -d'     # cd, same functionality as j in autojump
alias cc='fasd_cd -d -i' # cd with interactive selection

alias v="f -e $EDITOR" # quick opening files with vim
alias o='a -e open_command' # quick opening files with xdg-open
alias m='f -e mpv' # quick opening files with mplayer
alias mk='mkdir'
alias ra="d -e ranger"

alias music="ncmpcpp"
alias nv="$EDITOR"
alias vi="$EDITOR"
alias snv="sudo $EDITOR"
alias snv="sudo $EDITOR"
alias r="ranger"
alias sr="sudo ranger"

alias zshrc="nvim ~/.zshrc"
alias bspwmrc="$EDITOR ~/.config/bspwm/bspwmrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
