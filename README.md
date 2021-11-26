### Selfhosted docker compose setup
Hi, this repository represents selfhosted applications. It helps track of any changes and act as backup server. The main goal is to keep configuration in separation of content itself. 

#### Requirements
Setup is based on Docker images, so it's natural that Docker is required. Initial setup works on ~2GB memory (with Synology's Disk Station Manager and other apps running). Except that you need some storege. 

### How to run it
##### Media: 
```shell
docker-compose up --detach --file ./docker/media-docker-compose.yaml
```
##### Paperless: 
```shell
docker-compose up --detach --file ./docker/paperless-docker-compose.yaml
```
##### Routing: 
```shell
docker-compose up --detach --file ./docker/routing-docker-compose.yaml
```
##### Torrent: 
```shell
docker-compose up --detach --file ./docker/torrent-docker-compose.yaml
```
##### Utilities: 
```shell
docker-compose up --detach --file ./docker/utilities-docker-compose.yaml
```

### Services 
1. Media - whole system for downloading and discovering movies, tv shows and subtitles for them
1. Paperless - no more paper document. Scan your files and put in one shared directory, it will be automatically picked up and process (OCR) with autotags and categories
1. Routing - reverse proxy system with uptime dashboard and notifications
1. Torrent - put Transmission behind container with NordVPN connection
1. Utilities - any utilities required by other services, just a common place to not duplicate 