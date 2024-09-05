#!/bin/sh

# Enable debugging
set -x

# Directory containing the MP3 files
MUSIC_DIR="/app/quran"

# Find a random MP3 file in the directory
RANDOM_MP3=$(find "$MUSIC_DIR" -type f -name '*.mp3' | shuf -n 1)

# Log the selected file
echo "Playing: $RANDOM_MP3"

# Play the random MP3 file using mpg123 in the background and get its PID
mpg123 "$RANDOM_MP3" &
MPG123_PID=$!

# Wait for mpg123 to finish
wait $MPG123_PID

# Kill the specific mpg123 process
kill $MPG123_PID 2>/dev/null

# Explicitly log when the script has completed
echo "Script completed."

