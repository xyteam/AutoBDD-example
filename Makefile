demo-up:
	cd demo-app && \
	npm install && \
	npm start

e2e-test: demo-up
	cd e2e-test && \
	make test

docker_run_e2e:
	cd .docker && \
	docker-compose run --rm autobdd-example-run "make e2e-test"
