#! /bin/bash 
picom &
urxvtd -q -o -f &
xset led named "Scroll Lock"
feh --bg-scale ~/.config/qtile/wallpapers/empty.jpg
nm-applet &
blueman-applet &
xinput set-prop "ELAN0650:01 04F3:304B Touchpad" "libinput Tapping Enabled" 1 &

mpd &
redshift-gtk -l 27.2046:77.4977 &
xfce4-power-manager
barrier &
emacs --daemon
