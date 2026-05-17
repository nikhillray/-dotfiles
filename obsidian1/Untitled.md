# My Minimalist Hyprland Rice

Published: January 20, 2026

After daily-driving Sway for a few months, I finally decided to jump into **Hyprland**. The animations are smooth, and the Wayland ecosystem is finally feeling mature enough for my workflow.

## Core Philosophy

I wanted a setup that is completely **Gruvbox-themed** and focused on keyboard-driven navigation. No title bars, no borders unless focused, and zero clutter.

Note: I'm running this on a Ryzen 5 5600H laptop. If you're on NVIDIA (like my RTX 3050), make sure to set the `WLR_NO_HARDWARE_CURSORS=1` env variable.

## Keybindings

Here is a snippet of my `hyprland.conf` for basic navigation:

```
# Set Mod Key
$mainMod = SUPER

# Core Bindings
bind = $mainMod, RETURN, exec, kitty
bind = $mainMod, Q, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating, 
bind = $mainMod, R, exec, rofi -show drun
```

## Next Steps

I'm still tweaking the `waybar` configuration to get the perfect minimalist status line. I'll post the dotfiles on GitHub once the colors are consistent across all my tools.