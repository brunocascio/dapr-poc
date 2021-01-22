#!/bin/sh

export DAPR_HOST_IP=$(ifconfig ethwe0 | grep "inet " | awk '{print $2}' | tr -d 'addr:')

dapr run \
    --app-id pythonapp \
    --dapr-http-port 3500 \
    --components-path "/app/components" \
    --log-level debug \
    --placement-host-address tasks.placement \
    -- python3 src/app.py
