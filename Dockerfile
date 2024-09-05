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

9m2pju@raspi-100:~/quran_cron $ cat Dockerfile
# Use the official Debian Slim image
FROM debian:bullseye-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    mpg123 \
    alsa-utils \
    cron \
    tzdata \
    vim \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the script and crontab into the container
COPY play_random_quran.sh /app/play_random_quran.sh
COPY crontab /etc/cron.d/mycron
RUN chmod a+x /app/play_random_quran.sh \
    && chmod 0644 /etc/cron.d/mycron \
    && crontab /etc/cron.d/mycron

# Set timezone
ENV TZ=Asia/Kuala_Lumpur

# Start cron and keep container running
CMD ["sh", "-c", "cron -f"]

