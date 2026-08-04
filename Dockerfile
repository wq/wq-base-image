FROM python:3.14-trixie

# Install base dependencies
RUN apt-get update && \
    apt-get install -y libgdal36 libsqlite3-mod-spatialite postgresql-client && \
    rm -rf /var/cache/ldconfig/aux-cache /var/cache/fontconfig/* && \
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log /var/log/apt/history.log /var/log/apt/term.log /var/log/alternatives.log

# Install node and npm
RUN \
    curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/* /var/log/dpkg.log /var/log/apt/history.log /var/log/apt/term.log /var/log/alternatives.log

# Settings
ENV PYTHONUNBUFFERED=1
