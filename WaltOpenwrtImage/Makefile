
IMAGE_NAME ?= rgrunbla/pc-x86-64-default
ALIAS1 = rgrunbla/pc-x86-64-client:latest
ALIAS2 = rgrunbla/pc-x86-64-client:stretch

build:
	docker build --pull=true --tag=$(IMAGE_NAME) .
	docker tag $(IMAGE_NAME) $(ALIAS1)
	docker tag $(IMAGE_NAME) $(ALIAS2)

publish:
	docker push $(IMAGE_NAME)
	docker push $(ALIAS1)
	docker push $(ALIAS2)

all: build
