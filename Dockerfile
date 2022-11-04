FROM ubuntu:22.10

ARG DEBIAN_FRONTEND=noninteractive
ARG PGCLI_PACKAGE_VERSION

RUN apt-get update \
 && apt-get install -y pgcli=$PGCLI_PACKAGE_VERSION postgresql-client \
 && apt-get clean \
 && rm /var/lib/apt/lists/* -fR

ENTRYPOINT ["pgcli"]
