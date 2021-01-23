_DAPR_VERSION := $(or ${DAPR_VERSION},1.0.0-rc.2)

export DAPR_VERSION=$(_DAPR_VERSION)

all: build deploy

_setup:
	# Install weave plugin (if not exists)
	@(docker plugin ls | grep weave) >/dev/null || ( \
		docker plugin install --grant-all-permissions --disable --alias weave weaveworks/net-plugin:latest_release \
		&& docker plugin set weave IPALLOC_RANGE=169.254.0.0/16 \
		&& docker plugin set weave WEAVE_MULTICAST=1 \
		&& docker plugin set weave WEAVE_PASSWORD=S3Cr3t! \
		&& docker plugin enable weave)

_registry:
	@(docker ps | grep registry:2) >/dev/null || docker run -d -p 5000:5000 registry:2

build: _registry
	@docker build --build-arg DAPR_VERSION=$(DAPR_VERSION) -t localhost:5000/dapr-nodeapp:dev node
	@docker build --build-arg DAPR_VERSION=$(DAPR_VERSION) -t localhost:5000/dapr-pythonapp:dev python
	@docker push localhost:5000/dapr-nodeapp:dev
	@docker push localhost:5000/dapr-pythonapp:dev

deploy: _setup
	@docker stack deploy -c docker-compose.yml dapr-example

clean:
	@docker stack rm dapr-example