FROM nginx:alpine AS base

RUN mkdir -p  /data
COPY . /data
COPY project/devops/conf/nginx/default.conf /etc/nginx/conf.d/default.conf