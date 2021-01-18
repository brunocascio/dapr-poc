#!/bin/bash

export DAPR_HOST_IP=$(ifconfig eth1 | grep "inet " | awk '{print $2}')

dapr run "$@"