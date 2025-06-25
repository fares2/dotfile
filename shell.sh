#!/bin/bash

# تثبيت الأدوات المطلوبة
echo "[+] Installing dependencies..."
sudo pacman -S --noconfirm polybar feh picom rofi lxappearance ttf-jetbrains-mono-nerd

# إنشاء مجلد polybar
mkdir -p ~/.config/polybar

# launch.sh
cat <<EOF > ~/.config/polybar/launch.sh
#!/bin/bash

killall -q polybar

while pgrep -u \$UID -x polybar >/dev/null; do sleep 1; done

polybar main &
EOF

chmod +x ~/.config/polybar/launch.sh

# config.ini
cat <<EOF > ~/.config/polybar/config.ini
[bar/main]
width = 100%
height = 27
background = #1e1e2e
foreground = #cdd6f4
font-0 = JetBrainsMono Nerd Font:style=Regular:pixelsize=12
modules-left = i3
modules-center = date
modules-right = volume wlan battery

[colors]
background = #1e1e2e
foreground = #cdd6f4
primary = #89b4fa
secondary = #f38ba8

[module/i3]
type = internal/i3
format = <label-state>
index-sort = true
label-focused = %name% 
label-focused-foreground = \${colors.primary}
label-unfocused = %name%
label-unfocused-foreground = \${colors.foreground}
label-visible = %name%
label-urgent = %name% 
label-urgent-foreground = \${colors.secondary}

[module/date]
type = internal/date
format =   %H:%M    %d/%m/%Y
interval = 60

[module/volume]
type = internal/volume
format-volume =   %percentage%%
format-muted = ﱝ  muted
use-ui-max = true

[module/wlan]
type = internal/network
interface = wlan0
interval = 5
format-connected =   %essid%
format-disconnected =   no wifi

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
poll-interval = 30
format-charging =  %percentage%%
format-discharging =   %percentage%%
format-full =   100%
EOF

# تعديل ملف i3
CONFIG_FILE=~/.config/i3/config

if grep -q "exec.*launch.sh" "\$CONFIG_FILE"; then
    echo "[i] Polybar launch already exists in i3 config."
else
    echo "[+] Updating i3 config to launch Polybar..."
    echo 'exec_always --no-startup-id ~/.config/polybar/launch.sh' >> "\$CONFIG_FILE"
fi

echo "[✓] Done! Restart i3 (Mod+Shift+R) or run ~/.config/polybar/launch.sh manually."
