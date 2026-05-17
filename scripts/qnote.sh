#!/bin/bash

# Configuration
NOTES_DIR="$HOME/Documents/typora" # Change this to your notes folder
EDITOR="typora"

# Create directory if it doesn't exist
mkdir -p "$NOTES_DIR"

# 1. Get list of existing notes + "New Note" option
options="Create New Note\n$(ls "$NOTES_DIR")"

# 2. Open Rofi to select
choice=$(echo -e "$options" | rofi -dmenu -i -p "Notes:")

# Exit if user hits Escape
[ -z "$choice" ] && exit 0

if [ "$choice" == "Create New Note" ]; then
  # 3. Ask for filename
  filename=$(rofi -dmenu -p "Enter filename (leave blank for date):")

  # 4. Handle blank filename (use YYYY-MM-DD)
  if [ -z "$filename" ]; then
    filename=$(date +%Y-%m-%d)
  fi

  # Ensure it has .md extension
  if [[ ! "$filename" == *.md ]]; then
    filename="${filename}.md"
  fi

  full_path="$NOTES_DIR/$filename"
  touch "$full_path"
  $EDITOR "$full_path"
else
  # 5. Open existing note
  $EDITOR "$NOTES_DIR/$choice"
fi
