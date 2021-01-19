all: build deploy

define build_push_image
	@docker build -t $(1) $(2)
	@docker push $(1)
endef

build: _registry
	# build fake services
	@$(call build_push_image,"localhost:5000/br1cascio/fake-orders-service","apps/fake-orders-service")
	@$(call build_push_image,"localhost:5000/br1cascio/fake-products-service","apps/fake-products-service")
	@$(call build_push_image,"localhost:5000/br1cascio/fake-users-service","apps/fake-users-service")

_registry:
	@(docker ps | grep registry:2) >/dev/null || docker run -d -p 5000:5000 registry:2

deploy: build
	@docker stack deploy -c stack.yml dapr

clean:
	@docker stack rm dapr