#!/bin/bash
set -eu

IMG_REGISTRY="192.144.178.98:443"
IMG_NAME="my/nginx"
IMG_TAG="1.0.1"
IMG_FULL_NAME="${IMG_REGISTRY}/${IMG_NAME}:${IMG_TAG}"

echo "login registry!"
docker login -u t1 -p 'Oa123!@#' 192.144.178.98:443
echo "build image!"
docker build -t ${IMG_FULL_NAME} -f project/Dockerfile .
echo "push image!"
docker push ${IMG_FULL_NAME}
echo "rmi image!"
docekr rmi ${IMG_FULL_NAME} || true

sed -i "s#{{IMG_NAME}}#${IMG_FULL_NAME}#g" deploy/deploy.yaml
sed -i "s#{{APP_VERSION}}#${IMG_FULL_NAME}#g" deploy/deploy.yaml
echo "toimges.sh ok~"