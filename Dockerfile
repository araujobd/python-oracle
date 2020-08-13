FROM python:3.8-slim-buster

LABEL maintainer="Bruno Dantas <bdantas47@hotmail.com>"

COPY instantclient-basic-linux.x64-19.8.0.0.0dbru.zip .

RUN apt update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt install -y --no-install-recommends libaio-dev unzip \
    && apt purge -y imagemagick imagemagick-6-common \
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/oracle \
    && unzip instantclient-basic-linux.x64-19.8.0.0.0dbru.zip -d /opt/oracle \
    && rm instantclient-basic-linux.x64-19.8.0.0.0dbru.zip

ENV LD_LIBRARY_PATH /opt/oracle/instantclient_19_8
