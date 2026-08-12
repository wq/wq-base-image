# wq base image

wq-base-image provides three Docker images for use in developing and deploying geospatial Python / Django / NodeJS / React / PostgreSQL / PostGIS applications.  It was originally created for use with the wq framework (<https://wq.io>) but can be used for any Python + Node project.

# [ghcr.io/wq/base](https://ghcr.io/wq/base)

Base container image with core dependencies, for use in production.

 * Debian 13 (Trixie)
 * Python 3.14
 * Node 24 LTS (from NodeSource)
 * GDAL 3.6
 * SpatialLite 5.1 (mod_spatialite)
 * PostgreSQL 17 (Client Only)

# [ghcr.io/wq/ssh](https://ghcr.io/wq/ssh)

Alternative production image that extends ghcr.io/wq/base to add:
 * OpenSSH Server
 * SSH configuration for [Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/configure-custom-container?tabs=debian&pivots=container-linux#enable-ssh)

 # [ghcr.io/wq/dev](https://ghcr.io/wq/dev)

[Dev Container](https://containers.dev/) image that extends ghcr.io/wq/base with the following features:

 * Common utils
 * Python dev tools
 * Node dev tools
 * Git integration

[wq-docker-template](https://github.com/wq/wq-docker-template) leverages both of these images together with the standard [PostGIS image](https://hub.docker.com/r/postgis/postgis/) to provide a ready-to-use project template, fully integrated with Github codespaces.