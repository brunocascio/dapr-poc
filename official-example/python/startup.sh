#!/bin/sh
echo "Starting DAPR"
#tail -f /dev/null

#iperf -c 224.0.0.0 -u -T 32 -t 3 -i 1
#dapr run --app-id pythonapp --dapr-grpc-port 50004 --dapr-http-port 3500 python3 app.py


dapr run --app-id pythonapp --dapr-grpc-port 50004 --dapr-http-port 3500 --placement-host-address tasks.placement:56000 python3 app.py
