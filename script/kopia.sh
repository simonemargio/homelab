#!/usr/bin/bash

CONTAINERS=("container_1" "container_2" "...")

action=$1

if [[ "$action" != "start" && "$action" != "stop" ]]; then
    echo "Usage: ./script.sh [start|stop]"
    exit 1
fi

if [[ "$action" == "stop" ]]; then
    for container in "${CONTAINERS[@]}"; do
        curl -sS --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.43/containers/${container}/stop"
        sleep 2
    done
fi

if [[ "$action" == "start" ]]; then
    for container in "${CONTAINERS[@]}"; do
        curl -sS --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.43/containers/${container}/start"
        sleep 2
    done
fi