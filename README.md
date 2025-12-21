# Self-hosted Infrastructure

This repository contains the configuration and deployment scripts for a self-hosted home laboratory. It uses **Ansible** for orchestration and **Docker Compose** for managing various services.

## Overview

The setup is designed to manage a homelab server (e.g., Synology NAS or a Linux server) by automating the deployment of Docker containers and their configurations.

- **Orchestration**: Ansible
- **Containerization**: Docker & Docker Compose (V2)
- **CI/CD**: Gitea Actions (configured via `.gitea/workflows/`)

## Project Structure

- `ansible/`: Core automation logic.
  - `group_vars/`: Global variables like `PUID`, `PGID`, `TZ`, and `SYNO_DIR`.
  - `playbooks/`: Ansible playbooks for deploying services (e.g., `homer.yaml`, `gatus.yaml`).
  - `roles/`: Reusable Ansible roles for Docker and container management.
- `docker/`: Docker Compose files (`*-docker-compose.yaml`) and service-specific configurations.
- `docs/`: Supplemental documentation (e.g., deployment guides).
- `scripts/`: Utility scripts for maintenance and testing.
- `Makefile`: Entry point for common deployment commands.

## Services

The infrastructure supports a wide range of self-hosted applications:

### Media & Entertainment
- **Plex**: Media server for movies and TV shows.
- **Audiobookshelf**: Audiobook and podcast server.
- **Kavita**: Digital library for ebooks and manga.
- **The "Arr" Stack**: Bazarr, Radarr, and Sonarr for media automation.
- **Mealie**: Recipe manager and meal planner.
- **Metube**: Web GUI for youtube-dl.

### Utilities & Productivity
- **Paperless-ngx**: Document management system.
- **Actual Budget**: Personal finance management.
- **Excalidraw**: Virtual whiteboard for sketching.
- **Filebrowser**: Web-based file manager.

### Networking & Infrastructure
- **Traefik**: Edge router and reverse proxy.
- **VPN**: Tailscale and Wireguard for secure remote access.
- **Cloudflared**: Secure tunneling to Cloudflare.
- **Uptime Kuma / Gatus**: Service monitoring and status pages.
- **Portainer**: Graphical interface for Docker management.
- **Watchtower**: Automatic updates for Docker containers.

### Development & Automation
- **Gitea**: Self-hosted Git service.
- **GitHub Runner / Gitea Runner**: Automation runners for CI/CD.
- **Home Assistant**: Centralized smart home control.

## Deployment

### Prerequisites
- Ansible installed on your local machine.
- SSH access to the target host (configured in `ansible/inventory.yaml`).

### Quick Start
Use the `Makefile` for common operations:

- **Test connection to hosts**:
  ```bash
  make ping
  ```
- **Deploy all services**:
  ```bash
  make all
  ```
- **Deploy a specific service** (e.g., Homer):
  ```bash
  make homer
  ```
- **View inventory**:
  ```bash
  make inventory
  ```

### Manual Execution
You can also run playbooks directly using `ansible-playbook`:
```bash
ansible-playbook -i ansible/inventory.yaml ansible/playbooks/homer.yaml
```

## Configuration
Global settings are managed in `ansible/group_vars/all.yaml`. This is where you define:
- `PUID`/`PGID`: User and group IDs for container permissions.
- `TZ`: System timezone (e.g., `Europe/Warsaw`).
- `SYNO_DIR`: The base directory for Docker data on the target host.

Service-specific configurations (like `homer/config.yml`) are stored in the `docker/` directory and synchronized during deployment.