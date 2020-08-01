.PHONY: help install depndencies build clean

NAME := tamakiii-sandbox/hello-wasmtime

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	build

dependencies:
	type docker > /dev/null

build:
	docker build -t $(NAME) .

bash:
	docker run -it -v $$(pwd):/usr/local/app/hello-wasmtime $(NAME) bash -l

clean:
	docker image rm $(NAME)
