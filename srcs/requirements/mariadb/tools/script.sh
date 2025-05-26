#!/bin/bash

# Create run dir for mysqld
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Start MariaDB in the background
service mariadb start
sleep 5

# Fallback: If no env var is set, use salma as the default
DB_NAME="${MYSQL_DATABASE:-salma}"

# Execute SQL to create DB, table, and insert data
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;

USE \`${DB_NAME}\`;

CREATE TABLE IF NOT EXISTS lalo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO lalo (username, email, password) VALUES 
('salma', 'salma@example.com', 'password123'),
('john', 'john@example.com', 'pass456');
EOF

# Shutdown MariaDB (so it can restart normally in container)
service mariadb stop

# Run actual MariaDB
exec mysqld_safe
