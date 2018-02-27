#!/usr/bin/sh


urxvtd &

/usr/bin/xset b off &
setxkbmap -layout "us,ru" -option grp:alt_shift_toggle

feh --bg-fill /mnt/files/cloud/pics/walls/9763289395_a5f984f63b_h.jpg

compton -b --config ~/.config/.compton.conf

xrdb -I $HOME/.config/palettes ~/.Xresources

# Colors
export Xcolor0=$(xrdb -query | grep color0 | cut -f2)
export Xcolor1=$(xrdb -query | grep color16 | cut -f2)
export Xcolor2=$(xrdb -query | grep color2 | cut -f2)
export Xcolor3=$(xrdb -query | grep color3 | cut -f2)
export Xcolor4=$(xrdb -query | grep color4 | cut -f2)
export Xcolor5=$(xrdb -query | grep color5 | cut -f2)
export Xcolor6=$(xrdb -query | grep color6 | cut -f2)
export Xcolor7=$(xrdb -query | grep color7 | cut -f2)
export Xcolor8=$(xrdb -query | grep color8 | cut -f2)
export Xcolor9=$(xrdb -query | grep color9 | cut -f2)
export Xcolor10=$(xrdb -query | grep color10 | cut -f2)
export Xcolor11=$(xrdb -query | grep color11 | cut -f2)
export Xcolor12=$(xrdb -query | grep color12 | cut -f2)
export Xcolor13=$(xrdb -query | grep color13 | cut -f2)
export Xcolor14=$(xrdb -query | grep color14 | cut -f2)
export Xcolor15=$(xrdb -query | grep color15 | cut -f2)

ntfs-3g /dev/sda6 /mnt/files

xset +fp /home/kumomi/.fonts
xset fp rehash

sxhkd &

exec bspwm
