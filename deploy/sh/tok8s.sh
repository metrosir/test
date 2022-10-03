#!/bin/bash
set -eu

PROJECT_NAME='test'
SSH_IP='10.0.16.9'
SSH_USER='zhengqilin'
UPLOAD_DIR="/home/zhengqilin/deploy/${PROJECT_NAME}"
DEPLOY_FILE="${UPLOAD_DIR}/deploy.yaml"

ssh ${SSH_USER}@${SSH_IP} "rm -rf ${DEPLOY_FILE}"
ssh ${SSH_USER}@${SSH_IP} "mkdir -p ${UPLOAD_DIR}"

scp -r ../deploy.yaml ${SSH_USER}@${SSH_IP}:${DEPLOY_FILE}

ssh ${SSH_USER}@${SSH_IP} "kubectl apply -y ${DEPLOY_FILE}"