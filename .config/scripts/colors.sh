# Shell variables

# Special
export background=$(xrdb -query | grep color0 | cut -f2)
export foreground=$(xrdb -query | grep color5 | cut -f2)
export cursor=$(xrdb -query | grep color5 | cut -f2)

# Colors
export color0= $(xrdb -query | grep color0 | cut -f2)
export color1= $(xrdb -query | grep color1 | cut -f2)
export color2= $(xrdb -query | grep color2 | cut -f2)
export color3= $(xrdb -query | grep color3 | cut -f2)
export color4= $(xrdb -query | grep color4 | cut -f2)
export color5= $(xrdb -query | grep color5 | cut -f2)
export color6= $(xrdb -query | grep color6 | cut -f2)
export color7= $(xrdb -query | grep color7 | cut -f2)
export color8= $(xrdb -query | grep color8 | cut -f2)
export color9= $(xrdb -query | grep color9 | cut -f2)
export color10= $(xrdb -query | grep color10 | cut -f2)
export color11= $(xrdb -query | grep color11 | cut -f2)
export color12= $(xrdb -query | grep color12 | cut -f2)
export color13= $(xrdb -query | grep color13 | cut -f2)
export color14= $(xrdb -query | grep color14 | cut -f2)
export color15= $(xrdb -query | grep color15 | cut -f2)
export color16= $(xrdb -query | grep color16 | cut -f2)

