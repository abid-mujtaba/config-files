#!/bin/bash

xrdb -merge .Xresources
slstatus &

# Setup toggling between US and PK (Urdu CRULP) keyboard layouts
setxkbmap -model pc105 -layout us,pk -variant ,urd-crulp -option grp:shift_caps_toggle

exec dwm
