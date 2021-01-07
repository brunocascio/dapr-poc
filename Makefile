all: build deploy

define buildx_image
	@docker buildx build --network host --push --cache-from src=$(1),type=registry -t $(1) $(2)
endef

build:
	# build fake services
	@$(call buildx_image,"br1cascio/fake-orders-service","apps/fake-orders-service")
	@$(call buildx_image,"br1cascio/fake-products-service","apps/fake-products-service")
	@$(call buildx_image,"br1cascio/fake-users-service","apps/fake-users-service")

deploy:
	@docker stack deploy -c stack.yml dapr

clean:
	@docker stack rm dapr