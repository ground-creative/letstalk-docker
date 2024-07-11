# DOCKER IMAGE FOR LET'S TALK AI VOICE TOOLS

Docker environment for letstalks ai voice tools

## Installation

1. Clone the repository

```
git clone https://github.com/ground-creative/letstalk-docker.git
```

2. Change environment variables in env.sample file and rename it to .env

## Usage

Add the correct permissions when installing deploy folder

```
USRID=$(id -u) GRPID=$(id -g) docker compose --project-name=letstalk up -d --build
```

or

```
docker compose --project-name=letstalk up -d
```

Or

```
docker compose --project-name=letstalk up -d --build
```

### Command Environment Variables

It's possible to override environmet variable file while starting or building a container

```
TEST=true COMMAND="tail -f /dev/null" docker compose --project-name=letstalk up -d
```
