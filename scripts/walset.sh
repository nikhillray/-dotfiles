#!/usr/bin/env zsh

# 1. Config
WALLPAPER_DIR="$HOME/Pictures/walls"

# 2. Ensure awww-daemon is running
if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon & 
    sleep 0.5 # Give it a moment to initialize
fi

# 3. Select wallpaper with nsxiv
selected_wall=$(nsxiv -t -b -o "$WALLPAPER_DIR" 2>/dev/null)

# 4. If an image was selected, apply everything
if [ -n "$selected_wall" ]; then
    # Set Wallpaper (using the new awww command)
    awww img "$selected_wall" --transition-type center --transition-step 90
    
    # Generate colors with pywal16
    # We use 'wal' because even pywal16 usually installs the 'wal' command
    # If 'wal' fails, change this line to 'pywal16 -i ...'
    wal -i "$selected_wall" -n -q
    
    # 5. Refresh Waybar (SIGUSR2 reloads CSS without restarting the bar)
    pkill -USR2 waybar
    
    notify-send "Theme & Wallpaper Updated" "$(basename "$selected_wall")"
else
    notify-send "Selection Cancelled"
fi
