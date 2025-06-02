# Inception Project

This is my **Inception** project completed at **42 Beirut**.  
It’s a Docker-based project that sets up and runs multiple services in isolated containers using **Docker** and **Docker Compose**.

---

## Project Overview

The goal of this project is to build a containerized environment from scratch with multiple interconnected services, simulating a simple web infrastructure.

---

## Services Included

- **Nginx** — acts as a reverse proxy and handles HTTPS with SSL certificates.  
- **WordPress** — a custom setup running as the main web application.  
- **MariaDB** — the database server storing WordPress data.  
- **Adminer** — lightweight database management tool to manage MariaDB.  
- **Redis** — used for caching to improve performance.  
- **Volumes** — persistent storage to ensure data remains after container restarts.

---

## Features

- All containers are built from **custom Dockerfiles** — no pre-built images used.  
- Secure container setup with limited permissions for better security.  
- Automatic orchestration of all services via **Docker Compose**.  
- Data persistence configured via Docker volumes.  
- HTTPS enabled through Nginx with self-signed certificates.

---

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/inception.git
   cd inception

