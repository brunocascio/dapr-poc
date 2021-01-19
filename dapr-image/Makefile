NODE_VERSION := $(or ${NODE_VERSION},14-alpine)
IMAGE_NAME := $(or ${IMAGE_NAME},"br1cascio/dapr")

NODE_IMAGE := $(IMAGE_NAME):node-$(NODE_VERSION)

all: build push

build:
	# nodejs version
	@docker build --target dapr-node -t $(NODE_IMAGE) --build-arg NODE_VERSION=$(NODE_VERSION) .

push:
	@docker push $(NODE_IMAGE)