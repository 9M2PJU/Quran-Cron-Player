#!/bin/sh

# Directory containing the MP3 files
MUSIC_DIR="/app/quran"

# Find a random MP3 file in the directory
RANDOM_MP3=$(find "$MUSIC_DIR" -type f -name '*.mp3' | shuf -n 1)

# Log the selected file
echo "Playing: $RANDOM_MP3"

# Play the random MP3 file using mpg123
mpg123 "$RANDOM_MP3"

