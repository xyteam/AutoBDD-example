demo-up:
	cd demo-app && \
	npm install && \
	npm start

e2e-test: demo-up
	cd e2e-test && \
	make test

docker-run:
	@echo make $@
	docker-compose run --rm autobdd-example-run "make $(jobs)"
