#!/usr/bin/env zsh

# 1. Configuration
export LC_ALL=C.UTF-8
WALLPAPER_DIR="/home/zeke/Pictures/walls"
DAEMON_SOCK="/run/user/1000/wayland-1-awww-daemon.sock"
ROFI_THEME="$HOME/.config/rofi/config.rasi"

# 2. Cleanup & Start Daemon
[ -e "$DAEMON_SOCK" ] && ! pgrep -x "awww-daemon" > /dev/null && rm "$DAEMON_SOCK"
pgrep -x "awww-daemon" > /dev/null || (awww-daemon &> /dev/null &!)

# 3. Generate the list with Icons
list_wallpapers() {
    for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp}(.N); do
        echo "$img\0icon\x1f$img"
    done
}

# 4. Select wallpaper with Custom Width
selected_wall=$(list_wallpapers | rofi -dmenu \
    -i \
    -p "󰸉" \
    -theme "$ROFI_THEME" \
    -theme-str '
        window { 
            width: 800px;           /* Adjust this to 1000px or 60% if needed */
        }
        element-text { 
            enabled: false; 
        } 
        element-icon { 
            size: 15ch;             /* Larger icons for the wider window */
            horizontal-align: 0.5; 
        }
        listview { 
            columns: 4;             /* More columns since the window is wider */
            lines: 3;               /* Controls how many rows show before scrolling */
            fixed-columns: true;
            spacing: 10px;
        } 
    ')

# 5. Set the wallpaper
if [ -n "$selected_wall" ]; then
    awww img "$selected_wall" --transition-type center --transition-step 90 &> /dev/null
    notify-send "Wallpaper Set" "$(basename "$selected_wall")"
fi
