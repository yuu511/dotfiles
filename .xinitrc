export TERMINAL='urxvt'
xrdb -merge ~/.Xresources
# xrandr --output DVI-D-1 --left-of HDMI-1
xrandr --output DisplayPort-2 --mode 2560x1440 -r 143.91
xrandr --output DisplayPort-1 --mode 1920x1080 -r 239.76
xrandr --output DisplayPort-1 --primary --left-of DisplayPort-2

# ibus-daemon -drx
fcitx5 -d

xset -dpms

# transformers ocr
transformers_ocr start
#Statusbar loop
while true; do
   xsetroot -name "  $(sensors | grep -A 0 'Tctl' | cut -c16-22)  $(sensors | grep "nvme-pci-0700" -A 2 | tail -n 1 | cut -c16-22) $(date +" %Y年%m月%d日  %H:%M")"
   sleep 5    # Update time every 5s
done &
exec dwm
