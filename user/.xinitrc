#!/bin/bash

# Turn off PC speaker (get rid of annoying system beep)
sudo /usr/local/bin/disable-pcspkr

# Set variable in systemd for dunst (notification deamon)
systemctl --user set-environment DISPLAY=:0

xrdb -merge .Xresources
slstatus &

# Setup toggling between US and PK (Urdu CRULP) keyboard layouts
setxkbmap -model pc105 -layout us,pk -variant ,urd-crulp -option grp:shift_caps_toggle

exec dwm
