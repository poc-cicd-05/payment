NAME = weaveworksdemos/payment
INSTANCE = payment

.PHONY: default copy test

default: test

copy:
	docker create --name $(INSTANCE) $(NAME)-dev
	docker cp $(INSTANCE):/app/main $(shell pwd)/app
	docker rm $(INSTANCE)

build:
	# docker build -t $(NAME) -f ./docker/payment/Dockerfile-release .
	# docker build -t $(NAME) -f ./docker/payment/Dockerfile ./docker

test:
	GROUP=weaveworksdemos COMMIT=$(COMMIT) ./scripts/build.sh
	./test/test.sh unit.py
	./test/test.sh container.py --tag $(COMMIT)
