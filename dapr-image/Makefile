NODE_VERSION := $(or ${NODE_VERSION},lts-alpine)
DAPR_VERSION := $(or ${DAPR_VERSION},1.0.0-rc.2)
IMAGE_NAME := $(or ${IMAGE_NAME},br1cascio/dapr)

NODE_IMAGE := $(IMAGE_NAME):$(DAPR_VERSION)-node-$(NODE_VERSION)

all: build push print_images

build:
	# nodejs version
	@docker build --target dapr-node -t $(NODE_IMAGE) \
		--build-arg DAPR_VERSION=$(DAPR_VERSION) \
		--build-arg NODE_VERSION=$(NODE_VERSION) \
		.

push:
	@docker push $(NODE_IMAGE)

print_images:
	@docker images | grep $(IMAGE_NAME)