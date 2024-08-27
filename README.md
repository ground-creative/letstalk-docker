# DOCKER IMAGE FOR LET'S TALK AI VOICE TOOLS

Docker environment for letstalks ai voice tools

Panel<br />
https://github.com/ground-creative/letstalk-panel

OpenVoice API Docker<br />
https://github.com/ground-creative/openvoice-docker

Fast Whisper Docker<br />
https://github.com/ground-creative/docker-fast-whisper

Ollama & open-webui<br />
https://github.com/open-webui/open-webui

## Installation

1. Clone the repository

```
git clone https://github.com/ground-creative/letstalk-docker.git
```

2. Change environment variables in env.sample file and rename it to .env

## Usage

Use letstalk sh script to build and manage the containers

```
cd scripts

# Build main container
./letstalk build

# Use -i to include extra compose files
./letstalk build -i="mysql"
./letstalk build -i="mysql,react-dev"

# Full commands list and options list
./letstalk -h

```

Create network

```
docker network create {NETWORK_NAME}
```

### Command Environment Variables

It's possible to override environmet variable file while starting or building a container

```
TEST=true COMMAND="tail -f /dev/null" docker compose --project-name=letstalk up -d
```
