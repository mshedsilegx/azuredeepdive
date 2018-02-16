#!/bin/bash
# -------------------------------------
#  docker build - build.sh
#  v1.00  2018.02.10  XdG
# -------------------------------------

export DATE_STAMP="$(date '+%Y%m%d-%H%M%S')"

export DOCKER_CONTENT_TRUST=1
export DOCKER_HOME="/var/lib/docker"
export DOCKER_PROJECTS="/var/lib/docker_projects"
export DOCKER_PROJECT_NGINX="${DOCKER_PROJECTS}/nginx-php-fpm"
export DOCKER_IMAGE_OL7="$(docker search --filter "is-official=true" --format "{{.Name}}" oraclelinux):7"
export DOCKER_LOGFILE="logs/build-${DATE_STAMP}.log"
export DOCKER_LOGCOMPOSE="logs/compose-${DATE_STAMP}.log"
export DOCKER_NGINX_PID="msh"
export DOCKER_NGINX_IID="${DOCKER_NGINX_PID}_nginx-phpfpm"
export DOCKER_NGINX_CID="${DOCKER_NGINX_IID}_1"

cd ${DOCKER_PROJECT_NGINX}

echo "===== A- Reset all docker environment ==========" | tee -a ${DOCKER_LOGFILE}
echo "[A1] Stop/Delete all Docker containers"  | tee -a ${DOCKER_LOGFILE}
docker stop $(docker ps -q) 2>/dev/null || docker kill $(docker ps -q) 2>/dev/null
docker rm -f $(docker ps -a -q) 2>/dev/null

echo "[A2] Delete all Docker images" | tee -a ${DOCKER_LOGFILE}
docker rmi -f $(docker images -q) 2>/dev/null

echo "===== B- Pulling Oracle Linux 7.4 latest image ==========" | tee -a ${DOCKER_LOGFILE}
docker pull ${DOCKER_IMAGE_OL7} | tee -a ${DOCKER_LOGFILE}
docker images ${DOCKER_IMAGE_OL7} | tee -a ${DOCKER_LOGFILE}

echo "===== C- Generating custom nginx/PHP/memcached image and derived container ==========" | tee -a ${DOCKER_LOGFILE}
docker-compose -p ${DOCKER_NGINX_PID} -f docker-compose.yml up --no-start | tee -a ${DOCKER_LOGCOMPOSE}

echo "===== D- Validating container ==========" | tee -a ${DOCKER_LOGFILE}
docker images ${DOCKER_NGINX_IID}  | tee -a ${DOCKER_LOGFILE}
docker ps -a --filter "name=${DOCKER_NGINX_CID}" | tee -a ${DOCKER_LOGFILE}
docker start ${DOCKER_NGINX_CID}
sleep 10
curl http://localhost/health.php
sleep 5
docker stats
