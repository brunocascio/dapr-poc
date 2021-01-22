#!/bin/sh

export DAPR_HOST_IP=$(ifconfig ethwe0 | grep "inet " | awk '{print $2}' | tr -d 'addr:')

dapr run \
    --app-id nodeapp \
    --app-port 3000 \
    --app-protocol http \
    --dapr-http-port 3500 \
    --components-path "/app/components" \
    --placement-host-address tasks.placement \
    --log-level debug \
    -- node ./src/app.js