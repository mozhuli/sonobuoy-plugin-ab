TARGET = sonobuoy-plugin-ab
GOTARGET = github.com/mozhuli/$(TARGET)
REGISTRY ?= wadelee
IMAGE = $(REGISTRY)/$(TARGET)
DOCKER ?= docker
VERSION ?= v0.1

all: container

container:
	$(DOCKER) build -t $(REGISTRY)/$(TARGET):latest -t $(REGISTRY)/$(TARGET):$(VERSION) .

push:
	$(DOCKER) push $(REGISTRY)/$(TARGET):latest
	$(DOCKER) push $(REGISTRY)/$(TARGET):$(VERSION)

.PHONY: all container push

clean:
	$(DOCKER) rmi $(REGISTRY)/$(TARGET):latest $(REGISTRY)/$(TARGET):$(VERSION) || true