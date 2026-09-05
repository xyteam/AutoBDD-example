### TLDR:

```
mkdir -p ~/Projects; cd ~/Projects; \
git clone https://github.com/xyteam/AutoBDD-example.git; \
cd ~/Projects/AutoBDD-example
export USER=$(whoami) HOSTOS=$(uname -s) USERID=$(id -u) GROUPID=$(id -g)
docker-compose run --rm autobdd-example-run "make e2e-test"
```
Open the searchable cucumber HTML report under test-results/AutoBDD-example_*GMT/index.html

## AutoBDD-example

**AutoBDD-example** is a BDD style (Cucumber/Gherkin) WEB/E2E test project. It takes full advantage of the open-source **AutoBDD** framework:

**[xyteam/AutoBDD](https://github.com/xyteam/AutoBDD)**

Using pre-canned Cucumber/Gherkin statements and you can automate

* web browser actions

* screen and keyboard/mouse actions

You can turn this example project into your own test project and start automating immediately.

### Prerequisite

The only prerequisite to run this project is a docker supporting host. Tested on Linux, MacOS, Windows.

The test project will download the two AutoBDD docker images automatically, and all framework related tasks are taken cared by these two docker images. All you need to do is to work on your test cases.

* **xyteam/autobdd-run**: For running BDD test in CI mode.

* **xyteam/autobdd-dev**: For developing and debugging your test project with shell and GUI.

> **Version sync (v3.0.0):** The four repos in this project set are aligned on
> **3.0.0** — AutoBDD (the framework, `package.json` + docker image tag
> `xyteam/autobdd:3.0.0`), AutoBDD-example, autobdd-test, and xySikulixApi — and
> are verified to work together on that version. `.env`'s `AutoBDD_Ver=3.0.0`
> selects the matching image. This 3.0.0 set is the base going forward; a future
> effort consolidates the repos and upgrades dependencies together.

### To run the full test (requires docker)

`make e2e-test` starts the local demo-app and the self-hosted mock servers
(`mock-app/`, see `mock-server.js`), then runs the whole suite (all e2e-test
modules) via the AutoBDD auto-runner.

```
cd ~/Projects/AutoBDD-example
export USER=$(whoami) HOSTOS=$(uname -s) USERID=$(id -u) GROUPID=$(id -g)
docker-compose run --rm autobdd-example-run "make e2e-test"
```

#### Run the full test with movie recording enabled
Add `--movie 1` to the auto-runner call so every scenario records a movie:

```
cd ~/Projects/AutoBDD-example
export USER=$(whoami) HOSTOS=$(uname -s) USERID=$(id -u) GROUPID=$(id -g)
docker-compose run --rm autobdd-example-run \
  'make demo-up && make mock-up && cd e2e-test && auto-runner.py --project AutoBDD-example --movie 1 --rerunfailed=1 -- --cucumberOpts.tags="not @pending"'
```

Recorded movies are written under `e2e-test/test-*/Passed_Linux_CH_*.mp4` (one per scenario).

#### Review the test report

Results land in `test-results/` under a timestamped folder, e.g.
`test-results/AutoBDD-example_<timestamp>GMT/index.html` (a searchable cucumber
HTML report). Open it in a browser, or serve the folder over http.

A sample green-run report output per e2e-test project (one passing scenario each,
as a text preview of what the HTML report shows) is available as a gist:
https://gist.github.com/xywang68/50431da8183bebe56aefecea5fd9efeb

### Special Mentions
  * Demo-App application and Precanned Cucumber-JS Steps are taken from **[webdriverio/cucumber-boilerplate](https://github.com/webdriverio/cucumber-boilerplate)**
