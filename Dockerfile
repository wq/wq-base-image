FROM python:3.14-trixie

# Install base dependencies
RUN apt-get update && apt-get install -y libgdal36 libsqlite3-mod-spatialite postgresql-client

# Install SSH server (for e.g. Azure)
RUN apt-get install -y openssh-server && echo "root:Docker!" | chpasswd
COPY sshd_config /etc/ssh/

# Install node and npm
RUN \
    curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs

# Settings
ENV PYTHONUNBUFFERED 1
