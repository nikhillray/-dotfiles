#!/usr/bin/env bash

# 1. Config
WALLPAPER_DIR="$HOME/Pictures/walls"

# 2. Select wallpaper using nsxiv
# -t = thumbnail mode
# -b = no borders
# -o = output selected file(s)
selected_wall=$(nsxiv -t -b -o "$WALLPAPER_DIR" 2>/dev/null)

# 3. Set wallpaper using feh
if [ -n "$selected_wall" ]; then
  feh --bg-fill "$selected_wall" &>/dev/null

fi
