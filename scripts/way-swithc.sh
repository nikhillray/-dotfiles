#!/bin/bash

# 1. Define paths
THEME_DIR="$HOME/.config/waybar/themes"
WAYBAR_CONFIG="$HOME/.config/waybar/config"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"

# 2. Get the list of theme folders
themes=$(ls "$THEME_DIR")

# 3. Use Rofi to select a theme
choice=$(echo -e "$themes" | rofi -dmenu -p "󰃟 Waybar Theme:" -i)

# 4. Apply the theme if a choice was made
if [ -n "$choice" ]; then
  # Kill existing Waybar instance
  killall waybar

  # Update symbolic links to point to the chosen theme
  ln -sf "$THEME_DIR/$choice/config" "$WAYBAR_CONFIG"
  ln -sf "$THEME_DIR/$choice/style.css" "$WAYBAR_STYLE"

  # Small delay to ensure process is fully killed before restarting
  sleep 0.1

  # Launch Waybar
  waybar &
fi
