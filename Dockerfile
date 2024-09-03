# Use the official Alpine Linux image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache mpg123 alsa-utils busybox-suid bash

# Copy the script into the container
COPY play_random_quran.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/play_random_quran.sh

# Copy the crontab file into the container
COPY crontab /etc/crontabs/root

# Start cron
CMD ["crond", "-f", "-l", "2"]

