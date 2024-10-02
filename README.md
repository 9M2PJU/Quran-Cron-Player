
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
   - Download Quran MP3 files from a reliable source.
   - Place all the MP3 files into the `quran` directory within your project folder.

3. **Configure Timezone:**
   - Edit the `timezone` file to specify your desired timezone (e.g., `Asia/Kuala_Lumpur`). This will ensure that the container runs with the correct local time.

4. **Configure Cron Jobs:**
   - Edit the `crontab` file to define your preferred playback times. The default setup will play Quran audio at specified intervals (e.g., 6:30 AM, 7 PM, and 12 midnight).

5. **Build and Run the Docker Container:**

   ```sh
   docker compose up -d --build
   ```

   This command will build the Docker image and start the container in detached mode.

## Configuration Details

### Timezone Synchronization
The Docker container is configured to synchronize its timezone with the host by mapping `/etc/localtime`. Ensure the timezone file reflects your local timezone, such as Asia/Kuala_Lumpur.

### Sound Device Access
The `/dev/snd` device is mapped to allow audio playback through ALSA. This ensures that audio output from the container can be routed to the host's sound system.

### Quran MP3 Files
Store your Quran MP3 files in the `quran` directory. The playback script will randomly select an MP3 file to play at the scheduled times defined in the `crontab`.

## Dockerfile Overview

The Dockerfile sets up an Alpine-based environment tailored for audio playback and cron scheduling. Key features include:

- **Package Installation**: Installs essential packages for cron and audio playback, including:
  - `busybox-suid`
  - `tzdata`
  - `mpg123` (for MP3 playback)
  - `alsa-lib` and `alsa-utils` (for audio support)
  
- **Cron Job Configuration**: Prepares cron jobs for automatic execution of the playback script based on the defined schedule.

- **Source File Management**: Copies relevant scripts and configuration files into the container.

## Docker Compose Configuration

The `docker-compose.yml` file outlines the services, volumes, and network settings necessary for the application. Important points include:

- **Volume Mappings**:
  - Maps the `quran` directory to access MP3 files.
  - Mounts the `crontab` file for easy editing of cron jobs without rebuilding the container.
  - Ensures timezone synchronization and sound device access.

## Usage

The container runs a cron job that executes `play_random_quran.sh` based on the schedule defined in the `crontab`. This script selects and plays a random MP3 file from the `quran` directory, enhancing your Quran listening experience.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve the project. Your feedback and suggestions help enhance this project.
