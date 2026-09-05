clean:
	rm -rf test-*/*.json test-*/*.png test-*/*.mp4 test-*/logs

# External-service demo features are now self-hosted against mock-app (see
# mock-server.js), so only @pending scenarios (intentionally-undefined step
# demos) are excluded from the default run.
test:
	auto-runner.py --project ${ABDD_PROJECT} --rerunfailed=1 -- --cucumberOpts.tags='not @pending'
