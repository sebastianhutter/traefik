# simple makefile to build and push docker container images
IMAGE_NAME = sebastianhutter/traefik

gocd:
	docker build -t $(IMAGE_NAME):gocd --build-arg TOML=gocd.toml .
	docker push $(IMAGE_NAME):gocd 