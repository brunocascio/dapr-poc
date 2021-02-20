_DAPR_VERSION := $(or ${DAPR_VERSION},1.0.0-rc.2)
_IPALLOC_RANGE := $(or ${IPALLOC_RANGE},169.254.0.0/16)

export DAPR_VERSION=$(_DAPR_VERSION)

all: build deploy-docker-swarm

define build_push_image
	@docker build --build-arg DAPR_VERSION=$(DAPR_VERSION) -t $(1) $(2)
	@docker push $(1)
endef

_setup:
	@echo "Installing weave plugin only if does not exist"
	@echo
	@echo "IMPORTANT: If you make changes on this, you have to delete it before in order to get the new changes"
	@echo
	@(docker plugin ls | grep weave) >/dev/null || ( \
		docker plugin install --grant-all-permissions --disable --alias weave weaveworks/net-plugin:latest_release \
		&& docker plugin set weave IPALLOC_RANGE=$(_IPALLOC_RANGE) \
		&& docker plugin set weave WEAVE_MULTICAST=1 \
		&& docker plugin set weave WEAVE_PASSWORD=S3Cr3t! \
		&& docker plugin enable weave)

build: _registry
	# build fake services
	@$(call build_push_image,"localhost:5000/br1cascio/fake-orders-service","apps/fake-orders-service")
	@$(call build_push_image,"localhost:5000/br1cascio/fake-products-service","apps/fake-products-service")
	@$(call build_push_image,"localhost:5000/br1cascio/fake-users-service","apps/fake-users-service")

_registry:
	@(docker ps | grep registry:2) >/dev/null || docker run -d -p 5000:5000 registry:2

deploy-docker-swarm: _setup build
	@docker stack deploy -c stack.yml dapr

deploy-docker-compose: _setup build
	@docker-compose -f stack.yml up -d

clean:
	@docker stack rm dapr >/dev/null || true
	@docker-compose -f stack.yml down -v -t1
	@docker plugin rm -f weave || true
	@echo
	@echo "Cleanup: OK"