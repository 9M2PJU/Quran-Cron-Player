
# Quran-Cron-Player

![image](https://github.com/user-attachments/assets/37e99bbb-83eb-4683-84b1-e6e10d663a5f)


## Overview

The Quran-Cron-Player project provides a Docker container setup for playing Quran MP3 audio files using ALSA in an Alpine Linux-based environment. The playback is managed by cron jobs, and MP3 files are played using `mpg123`.

## Important

1. **Download and Setup MP3 Files:**
   - Download Quran MP3 files from a reliable source like https://quranicaudio.com/.
   - Place all the downloaded MP3 files into the `quran` folder.

## Project Structure

```
/app
├── crontab                 # Cron job configuration file
├── docker-compose.yml      # Docker Compose configuration
├── Dockerfile              # Dockerfile for building the container
├── play_random_quran.sh    # Script for playing random Quran MP3 file
├── quran                   # Directory for Quran MP3 files
│   ├── [MP3 files]
└── README.md               # Project documentation
└── timezone                # Timezone data (change if needed)
```

## Prerequisites

- Docker
- Docker Compose

## Setup

1. **Clone the Repository:**

   ```sh
   git clone https://github.com/9M2PJU/Quran-Cron-Player.git
   cd Quran-Cron-Player
   ```

2. **Download and Setup MP3 Files:**
   - Obtain the Quran MP3 files from a reliable source.
   - Place all the MP3 files into the `quran` directory within the project folder.

3. **Configure Cron Jobs:**
   - Edit the `crontab` file to set your preferred times for Quran playback.

4. **Build and Run the Docker Container:**

   ```sh
   docker compose up -d --build
   ```

   This will build the Docker image and start the container in detached mode.

## Configuration

### Timezone Synchronization
Ensure that `/etc/localtime` is correctly mapped to keep the container’s timezone synchronized with the host.

### Sound Device Access
Map `/dev/snd` to allow audio playback through ALSA.

### Quran MP3 Files
Place your Quran MP3 files in the `quran` directory.

## Dockerfile

The Dockerfile creates an Alpine-based environment with `mpg123` for MP3 playback and `cron`. It includes:

- Installation of necessary packages (`busybox-suid`, `tzdata`, `mpg123`, `alsa-lib`, `alsa-utils`)
- Configuration of cron jobs to schedule playback
- Copying of source files and timezone configuration

## Docker Compose

The `docker-compose.yml` file defines the services, volumes, and ports required for the project. Key points include:

- Volume mappings for timezone and sound device access.
- Mounting the `quran` directory for MP3 files.
- Mounting the `crontab` for easy cron job management.

## Usage

The container runs a cron job that executes `play_random_quran.sh` based on the schedule defined in the `crontab`. This script plays a random MP3 file from the `quran` directory.

To build and run the container, use the following command:

```bash
docker-compose up --build

## Contributing

Feel free to submit issues or pull requests to improve the project. Contributions are welcome!

