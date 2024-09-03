

# Quran-Cron-Player

## Overview

The Quran-Cron-Player project provides a Docker container setup for playing Quran MP3 audio files using ALSA in an Alpine Linux-based environment. The playback is controlled by a cron job, and MP3 files are played using `mpg123`.

## Important

1. **Download and Setup MP3 Files:**
   - Download the Quran MP3 files from a reliable source.
   - Place all downloaded MP3 files into the `quran` folder.

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

2. **Download Quran MP3 Files:**
   - Obtain the Quran MP3 files from a reliable source. You can find these files on various Islamic resources or websites that provide Quran audio.
   - Place all the MP3 files into the `quran` directory within the project folder.

3. **Edit Crontab:**
   - Modify the `crontab` file to set the desired times for the Quran playback.

4. **Build and Run the Docker Container:**

   ```sh
   docker compose build
   docker compose up -d
   ```

   This will build the Docker image and start the container in detached mode.

## Configuration

- **Timezone Synchronization:** Ensure that `/etc/localtime` is correctly mapped to keep the container’s timezone synchronized with the host.
- **Sound Device Access:** Map `/dev/snd` to allow audio playback through ALSA.
- **Quran MP3 Files:** Ensure that MP3 files are correctly placed in the `quran` directory.

## Dockerfile

The `Dockerfile` sets up an Alpine-based environment with `mpg123` for MP3 playback and cron. It includes:

- Installation of necessary packages
- Configuring cron jobs
- Copying source files and configuration

## Docker Compose

The `docker-compose.yml` file defines the services, volumes, and ports required for the project. Key points:

- **Volume Mappings:** Ensure timezone and sound device access.

## Usage

The container runs a cron job that executes `play_random_quran.sh` based on the schedule defined in the crontab. This script plays a random MP3 file from the `quran` directory.

## Contributing

Feel free to submit issues or pull requests to improve the project. Contributions are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

