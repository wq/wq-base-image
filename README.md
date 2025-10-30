# wq base image

wq-base-image provides two Docker images for use in developing and deploying geospatial Python / Django / NodeJS / React / PostgreSQL / PostGIS applications, e.g. with the wq framework (<https://wq.io>).

# [ghcr.io/wq/base](https://ghcr.io/wq/base)

Base container image with core dependencies.

 * Debian 13 (Trixie)
 * Python 3.14
 * Node 24 LTS (from NodeSource)
 * GDAL 3.6
 * SpatialLite 5.1
 * PostgreSQL 17 (Client Only)
 * OpenSSH Server with [configuration for Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/configure-custom-container?tabs=debian&pivots=container-linux#enable-ssh)

 # [ghcr.io/wq/dev](https://ghcr.io/wq/dev)

[Dev Container](https://containers.dev/) image extending the base container with the following features:

 * Common utils
 * Python dev tools
 * Node dev tools
 * Git

[wq-docker-template](https://github.com/wq/wq-docker-template) leverages both of these images together with the standard [PostGIS image](https://hub.docker.com/r/postgis/postgis/) to provide a ready-to-use project template, fully integrated with Github codespaces.