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

## Troubleshooting


```
dial unix /run/docker/plugins/<HASH>/weave.sock: connect: no such file or directory
```

It mostly occurs by overlapping networks. You can run this command to figure it out:

```
journalctl -u docker.service
```

The output would be something like:

```
... level=error msg="Network 169.254.0.0/16 overlaps with existing route 169.254.0.0/16 on host" ...
```

For this, export your desired IPALLOC_RANGE and make it again:

```bash
$ make clean # we need to delete the wrong weave plugin installation
$ export IPALLOC_RANGE=10.32.0.0/12
$ make deploy-docker-swarm
```