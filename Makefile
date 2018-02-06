# simple makefile to build and push docker container images
IMAGE_NAME = sebastianhutter/traefik

gocd:
	docker build -t $(IMAGE_NAME):gocd --build-arg TOML=gocd.toml .
	docker push $(IMAGE_NAME):gocd 

general:
	docker build -t $(IMAGE_NAME):general --build-arg TOML=general.toml .
	docker push $(IMAGE_NAME):general 

auth:
	docker build -t $(IMAGE_NAME):auth --build-arg TOML=auth.toml .
	docker push $(IMAGE_NAME):auth 