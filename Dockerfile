# Use Alpine Linux as the base image
FROM alpine:latest

# Install required packages including cron, audio tools, and dependencies
RUN apk add --no-cache busybox-suid tzdata mpg123 alsa-lib alsa-utils

# Set the working directory in the container
WORKDIR /app

# Copy the timezone file to the container
COPY timezone /etc/localtime

# Copy the play_random_quran.sh script to the container
COPY play_random_quran.sh /app/play_random_quran.sh

# Make the script executable
RUN chmod a+x /app/play_random_quran.sh

# Use an entrypoint script to start multiple processes
ENTRYPOINT ["/bin/sh", "-c", "crond -f -L /var/log/cron.log"]
