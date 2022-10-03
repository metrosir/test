#!/bin/bash
set -eu

IMG_REGISTRY = "192.144.178.98:443"
IMG_NAME = "my/nginx"
IMG_TAG = "1.0.1"
IMG_FULL_NAME="${IMG_REGISTRY}/${IMG_NAME}:${IMG_TAG}"

docker login -u t1 -p 'Oa123!@#' 192.144.178.98:443
docker build -t ${IMG_FULL_NAME} -f project/Dockerfile
docker push ${IMG_FULL_NAME}
docekr rmi ${IMG_FULL_NAME}

sed -i "s#{{IMG_NAME}}#${IMG_FULL_NAME}#g" ../deploy.yaml
sed -i "s#{{APP_VERSION}}#${IMG_FULL_NAME}#g" ../deploy.yaml