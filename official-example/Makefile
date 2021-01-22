all: build deploy

_registry:
	@(docker ps | grep registry:2) >/dev/null || docker run -d -p 5000:5000 registry:2

build: _registry
	@docker build -t localhost:5000/dapr-nodeapp:dev node
	@docker build -t localhost:5000/dapr-pythonapp:dev python
	@docker push localhost:5000/dapr-nodeapp:dev
	@docker push localhost:5000/dapr-pythonapp:dev

deploy:
	@docker stack deploy -c docker-compose.yml dapr-example

clean:
	@docker stack rm dapr-example