# PHP Server Monoitor on a Docker Container
This repo dockerizes [PHP Server Monitor](https://github.com/phpservermon/phpservermon)

### Step 1: Get updated docker and docker compose
Check you have instaled required version Docker Engine >= 1.10.0 and Docker Compose >= 1.6.2.
```shell
docker -v
docker-compose version
```
[Install or update Docker Engine](https://docs.docker.com/engine/installation)

[Install or update Docker Compose](https://docs.docker.com/compose/install)

If you're a Mac or Windows user, the Docker Toolbox will install Compose 1.6.2 for you, alongside the latest versions of Docker Engine, Machine and Kitematic.

Alternatively, you can use the usual commands to install or upgrade:
```shell
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

### Step 2: Run compose
You should run this command in the root folder of this repo as follows:
```shell
docker-compose up -d
```

### Step 3: Initial login
Initial login detials: `username`:`admin` and `password`:`password`
