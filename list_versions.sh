#!/bin/bash

DEBIAN_VERSION=$(cat /etc/debian_version)
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
PIP_VERSION=$(pip3 --version | awk '{print $2}')
NODE_VERSION=$(node --version | sed 's/v//')
NPM_VERSION=$(npm --version)
PSQL_VERSION=$(psql --version | awk '{print $3}')
SPATIALITE_VERSION=$(dpkg-query -W --showformat='${Version}' libsqlite3-mod-spatialite)
GDAL_VERSION=$(dpkg-query -W --showformat='${Version}' libgdal36)
SSHD_VERSION=$(sshd -V 2>&1 | awk '{print $1}' | sed 's/sshd://')

echo "## Software Versions"
echo ""
echo "Software | Version | Notes"
echo "--- | --- | ---"
echo "Debian | $DEBIAN_VERSION | Trixie"
echo "Python | $PYTHON_VERSION | Official Dockerhub image"
echo "Pip | $PIP_VERSION | Official Dockerhub image"
echo "Node.js | $NODE_VERSION | Installed from NodeSource"
echo "NPM | $NPM_VERSION | Installed from NodeSource"
echo "GDAL | $GDAL_VERSION | libgdal36"
echo "SpatiaLite | $SPATIALITE_VERSION | libsqlite3-mod-spatialite"
echo "PostgreSQL | $PSQL_VERSION | postgresql-client"
echo "OpenSSH Server | $SSHD_VERSION | Only in ghcr.io/wq/ssh"
echo ""