#!/usr/bin/env bash
docker run \
  --name ry-nacos \
  -e MODE=standalone \
  -e MYSQL_SERVICE_HOST=host.docker.internal \
  -e MYSQL_SERVICE_DB_NAME=ry-config \
  -e MYSQL_SERVICE_USER=root \
  -p 8848:8848 \
  -p 9848:9848 \
  -d \
  nacos/nacos-server:latest-slim


docker run \
  --name nacos \
  -d \
  -e MODE=standalone \
  -p 8848:8848 \
  -p 9848:9848 \
  -v /data/nacos/conf/:/home/nacos/conf \
  -v /data/nacos/data/:/home/nacos/data \
  -v /data/nacos/logs/:/home/nacos/logs \
  nacos/nacos-server:v2.3.1-slim
