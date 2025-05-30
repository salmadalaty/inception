# 🏰 Inception

**Inception** is a system administration project from the 42 School curriculum. It introduces containerization, service orchestration, and deployment techniques using Docker and docker-compose. The objective is to build and configure a secure, containerized infrastructure running a full WordPress website behind an Nginx reverse proxy with HTTPS support.

---

## 📐 Project Overview

This project aims to:

- Implement a production-grade web stack using only Docker containers.
- Manage services and networking through docker-compose.
- Enforce secure communication with SSL.
- Maintain data persistency across service restarts.

---

## 📦 Architecture

The application stack consists of three main services:

| Service   | Description                                       |
|-----------|-------------------------------------------------|
| **Nginx** | Reverse proxy with SSL termination using self-signed certs |
| **WordPress** | PHP-based CMS using PHP-FPM to process requests |
| **MariaDB** | MySQL-compatible database for WordPress content |

These services are isolated in containers, orchestrated via docker-compose.

---

## 🧱 Directory Structure

```bash
srcs/
├── docker-compose.yml       # Main orchestration file
├── .env                     # Environment variables
├── requirements/
│   ├── nginx/
│   │   ├── Dockerfile
│   │   └── conf/nginx.conf
│   ├── wordpress/
│   │   ├── Dockerfile
│   │   └── tools/setup.sh
│   └── mariadb/
│       ├── Dockerfile
│       └── tools/setup.sh
└── data/
    ├── wordpress/           # WordPress persistent volume
    └── mariadb/             # MariaDB persistent volume

🔄 Workflow Diagram
    Client -->|HTTPS| NGINX
    NGINX -->|Static Content| Client
    NGINX -->|FastCGI (PHP)| WordPress
    WordPress -->|DB Queries| MariaDB

🚀 Getting Started
1. Clone the Repository

git clone https://github.com/sdalaty/inception.git
cd inception/srcs
2. Configure Environment
Update your .env file with secure credentials:

MYSQL_DATABASE=wordpress
MYSQL_USER=salma
MYSQL_PASSWORD=123456
MYSQL_ROOT_PASSWORD=root

3. Build and Launch

docker-compose up --build
4. Access the Website
Open your browser and navigate to:
https://sdalaty.42.fr
⚠️ Note: Since the certificate is self-signed, your browser may show a security warning.

🔐 Security Features
HTTPS: Enforced via a self-signed SSL certificate using OpenSSL.

Isolated Database: MariaDB is not exposed to external networks.

Environment Variables: Secrets and credentials are stored in the .env file.

Non-root Users: Services run under non-privileged users where applicable.

📂 Volumes for Data Persistence
Path	Purpose
/home/sdalaty/data/wordpress	Stores WordPress files
/home/sdalaty/data/mariadb	Stores database contents

These volumes ensure your data survives container restarts and rebuilds.

✅ Features & Requirements
✅ Fully containerized with Docker

✅ HTTPS via Nginx and SSL

✅ WordPress configured with PHP-FPM

✅ MariaDB integration

✅ Persistent storage with Docker volumes

✅ Non-root container execution

✅ Secrets managed via .env

✅ Auto-restart policies for reliability

👩‍💻 Author
Salma Dalaty
Student at 42 Beirut

