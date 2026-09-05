# export dynamic env for docker-compose (not shell-substitutable in .env)
export USER ?= $(shell whoami)
export HOSTOS ?= $(shell uname -s)
export USERID ?= $(shell id -u)
export GROUPID ?= $(shell id -g)
export PASSWORD ?= ubuntu

demo-up:
	cd demo-app && \
	npm install && \
	npm start

# start the local mock server (static pages :8090, restful-booker API :8091,
# download fixtures :8092) used by the retargeted external-service demo features
mock-up:
	npm run mock-app

mock-down:
	npm run stop

e2e-test: demo-up mock-up
	cd e2e-test && \
	make test

docker-run:
	@echo make $@
	docker-compose run --rm autobdd-example-run "make $(jobs)"
