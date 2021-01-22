#!/bin/sh
echo "Starting DAPR"
#tail -f /dev/null
#iperf -s -u -B 224.0.0.0 -i 1
#dapr run --app-id nodeapp --app-port 3000 --dapr-grpc-port 50002 --dapr-http-port 3500 node app.js



dapr run --app-id nodeapp --app-port 3000 --dapr-grpc-port 50002 --dapr-http-port 3500 node app.js
