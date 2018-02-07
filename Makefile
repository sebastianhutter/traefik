# simple makefile to build and push docker container images
IMAGE_NAME = sebastianhutter/traefik

gocd:
	docker build -t $(IMAGE_NAME):gocd --build-arg TOML=gocd.toml .
	docker push $(IMAGE_NAME):gocd 

front:
	docker build -t $(IMAGE_NAME):front --build-arg TOML=front.toml .
	docker push $(IMAGE_NAME):front 

back:
	docker build -t $(IMAGE_NAME):back --build-arg TOML=back.toml .
	docker push $(IMAGE_NAME):back 

auth:
	docker build -t $(IMAGE_NAME):auth --build-arg TOML=auth.toml .
	docker push $(IMAGE_NAME):auth 

drone:
	# FOR DNSRR WE NEED TO USE OLDER TRAEFIK VERSION...
	docker build -t $(IMAGE_NAME):drone --build-arg TOML=drone.toml --build-arg VERSION=1.4-alpine .
	docker push $(IMAGE_NAME):drone 