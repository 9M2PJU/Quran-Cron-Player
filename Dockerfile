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

