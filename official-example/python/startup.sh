#!/bin/sh

mkdir -p /app/components

export DAPR_HOST_IP=$(ifconfig ethwe0 | grep "inet " | awk '{print $2}' | tr -d 'addr:')

dapr run \
    --app-id pythonapp \
    --dapr-http-port 3500 \
    --log-level debug \
    --placement-host-address tasks.placement \
    -- python3 src/app.py
