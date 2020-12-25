export TERMINAL='urxvt'
xrdb -merge ~/.Xresources
# xrandr --output DVI-D-1 --left-of HDMI-1
xrandr --output DisplayPort-2 --mode 2560x1440 -r 144
xrandr --output DisplayPort-1 --mode 1920x1080 -r 144
xrandr --output DisplayPort-2 --primary --left-of DisplayPort-1 
Statusbar loop
fcitx -d
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
while true; do
   xsetroot -name "  $(sensors | grep -A 0 'Tdie' | cut -c16-22)  $(sensors | grep "nvme-pci-0500" -A 2 | tail -n 1 | cut -c16-22) $(date +" %Y年%m月%d日  %H:%M")"
   sleep 5    # Update time every 5s
done &
exec dwm
