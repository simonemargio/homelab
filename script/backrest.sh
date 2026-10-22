#!/bin/sh

CONTAINERS="container_1 container_2 ... container_n"

action="$1"

if [ "$action" != "start" ] && [ "$action" != "stop" ]; then
    echo "Uso: ./script.sh [start|stop]"
    exit 1
fi

if [ "$action" = "stop" ]; then
    for container in $CONTAINERS; do
        echo "Shutting down $container..."
        curl -sS --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.43/containers/${container}/stop"
        sleep 2
    done
fi

if [ "$action" = "start" ]; then
    for container in $CONTAINERS; do
        echo "Starting $container..."
        curl -sS --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.43/containers/${container}/start"
        sleep 2
    done
fi
