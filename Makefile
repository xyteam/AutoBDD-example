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

# Tool actions (non-e2e: API/postman, jest, pytest, k6) are BDD cucumber features,
# so there are no separate make targets for them:
#   e2e-test/test-postman  - postman collection via newman
#   e2e-test/test-tools    - jest / pytest / k6, each run as a direct command carried
#                            by the feature: "When I run this command \"...\""
# They run with the rest of the suite via `make e2e-test`.

docker-run:
	@echo make $@
	docker-compose run --rm autobdd-example-run "make $(jobs)"
