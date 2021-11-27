### Selfhosted docker compose setup
Hi, this repository represents selfhosted applications. It helps track of any changes and act as backup server. The main goal is to keep configuration in separation of content itself. 

#### Requirements
Setup is based on Docker images, so it's natural that Docker is required. Initial setup works on ~2GB memory (with Synology's Disk Station Manager and other apps running). Except that you need some storege. 

### How to run it
Shared dependencies like networks need to be created before most of services: 
```shell
docker network create utilites
```
##### Media: 
```shell
docker network create media
docker-compose --file docker/media-docker-compose.yaml up --detach
```
##### Paperless: 
```shell
docker volume create --name=paperless_pl_media
docker volume create --name=paperless_pl_data
docker-compose --file docker/paperless-docker-compose.yaml up --detach
```
##### Routing: 
```shell
docker-compose --file docker/routing-docker-compose.yaml up --detach
```
##### Torrent: 
```shell
docker-compose --file docker/torrent-docker-compose.yaml up --detach
```
##### Utilities: 
```shell
docker volume create --name=utils_pgdata
ddocker-compose --file docker/utilities-docker-compose.yaml up --detach
```

### Services 
1. Media - whole system for downloading and discovering movies, tv shows and subtitles for them
1. Paperless - no more paper document. Scan your files and put in one shared directory, it will be automatically picked up and process (OCR) with autotags and categories
1. Routing - reverse proxy system with uptime dashboard and notifications
1. Torrent - put Transmission behind container with NordVPN connection
1. Utilities - any utilities required by other services, just a common place to not duplicate 