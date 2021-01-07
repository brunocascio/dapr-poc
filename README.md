# Dapr PoC

## Deploy stack

`make deploy`

## Clean stuff

`make clean`

## Reach services

Perform a POST request to `http://api.0.0.0.0.sslip.io/orders`

Example with curl

```
curl -X POST http://api.0.0.0.0.sslip.io/orders
```