#!/bin/sh

# Make sure config.yaml exists
touch "${HOME}/.dapr/config.yaml"

# Specify weave network interface
# It's needed since dapr use multicast, so make sure that you'd attached a weave network
# to this container with multicast enabled weave flag
export DAPR_HOST_IP=$(ifconfig ethwe0 | grep "inet " | awk '{print $2}' | tr -d 'addr:')

dapr run \
    --app-id "${DAPR_APP_ID}" \
    --app-port "${DAPR_APP_PORT}" \
    --dapr-http-port ${DAPR_HTTP_PORT:-3500} \
    --components-path ${DAPR_COMPONENTS_PATH:-"${HOME}/.dapr/components"} \
    --log-level ${DAPR_LOG_LEVEL:-warn} \
    --placement-host-address ${DAPR_PLACEMENT_HOST_ADDRESS:-tasks.placement} \
    -- "$@"