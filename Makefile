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

# tool actions: non-e2e tool tests (unit / performance). The API/postman suite
# lives with the e2e modules (e2e-test/test-postman).
jest-test:
	mkdir -p test-results/jest-test; \
	cd js-test && npm install && \
	node_modules/.bin/jest --verbose . > ../test-results/jest-test/run.log 2>&1; \
	exit $$?

pytest-test:
	mkdir -p test-results/pytest-test; \
	pip3 install -q -r py-test/requirement3.txt && \
	python3 -m pytest -r A py-test > test-results/pytest-test/run.log 2>&1; \
	exit $$?

k6-test:
	mkdir -p test-results/k6-test; \
	cd k6-test && for f in $$(find . -type f -name "*-test.js"); do k6 run "$$f"; done > ../test-results/k6-test/run.log 2>&1; \
	exit $$?

# run all non-e2e tool tests
tool-test: jest-test pytest-test k6-test

docker-run:
	@echo make $@
	docker-compose run --rm autobdd-example-run "make $(jobs)"
