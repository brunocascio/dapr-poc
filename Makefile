all: build deploy

build:
	# build fake services
	@docker build -t br1cascio/fake-orders-service apps/fake-orders-service
	@docker build -t br1cascio/fake-products-service apps/fake-products-service
	@docker build -t br1cascio/fake-users-service apps/fake-users-service
	# Push services to dockerhub
	@docker push br1cascio/fake-orders-service
	@docker push br1cascio/fake-products-service
	@docker push br1cascio/fake-users-service

deploy:
	@docker stack deploy -c stack.yml dapr

clean:
	@docker stack rm dapr