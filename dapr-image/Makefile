DAPR_CLI_VERSION := $(or ${DAPR_CLI_VERSION},master)
NODE_VERSION := $(or ${NODE_VERSION},14)
IMAGE_NAME := $(or ${IMAGE_NAME},"br1cascio/dapr")

BASE_IMAGE := $(IMAGE_NAME):$(DAPR_CLI_VERSION)-base
NODE_IMAGE := $(IMAGE_NAME):$(DAPR_CLI_VERSION)-node-$(NODE_VERSION)

all: build push

build:
	# base version
	@docker build --pull --target dapr-base --build-arg DAPR_CLI_VERSION=$(DAPR_CLI_VERSION) -t $(BASE_IMAGE) .
	# nodejs version
	@docker build --pull --target dapr-node --build-arg NODE_VERSION=$(NODE_VERSION) -t $(NODE_IMAGE) .
	# print out images
	@docker images | grep $(IMAGE_NAME)

push:
	@docker push $(BASE_IMAGE)
	@docker push $(NODE_IMAGE)