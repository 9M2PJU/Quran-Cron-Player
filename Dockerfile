# Use the latest Alpine version
FROM alpine:latest

# Set the timezone environment variable
ENV TZ=Asia/Kuala_Lumpur

# Install necessary packages
RUN apk add --no-cache \
    mpg123 \
    alsa-utils \
    bash \
    tzdata \
    vim \
    procps \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# Create the app directory
RUN mkdir -p /app

# Copy the script and crontab into the container
COPY play_random_quran.sh /app/play_random_quran.sh
COPY crontab /etc/crontabs/mycron

# Ensure the script is executable and set the correct permissions for the crontab
RUN chmod +x /app/play_random_quran.sh \
    && chmod 0644 /etc/crontabs/mycron

# Start cron and keep the container running
CMD ["crond", "-f"]

