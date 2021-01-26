# Dapr PoC

## Deploy stack

`make deploy-docker-swarm` or `make deploy-docker-compose`

## Clean stuff

`make clean`

## Reach services

Perform a POST request to `http://api.0.0.0.0.sslip.io/orders` (swarm)

Perform a POST request to `http://localhost:3000/orders` (compose)

Example with curl (swarm)

```
curl -X POST http://api.0.0.0.0.sslip.io/orders
```

## Trade off

- Weave network plugin is needed since dapr use multicast for service discovery and overlay network does not support it.
- If you attach 2 weave network to a same service, you'll get an error about virtual interfaces (?) (might be bug)
