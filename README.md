# AutoBDD-example

**AutoBDD-example** is the **example test project for the
[AutoBDD](https://github.com/xyteam/AutoBDD) framework** — a BDD (Cucumber/Gherkin)
web/E2E test project.

It demonstrates the two kinds of actions AutoBDD provides:

- **web-page actions** — drive a real browser with pre-canned Cucumber steps, and
- **screen-image actions** — find, click and assert on anything on screen using the
  images and text you provide (image matching + OCR), not just DOM elements.

You do **not** need the AutoBDD framework repository. Running this project
**automatically pulls the AutoBDD docker image** (`xyteam/autobdd:<version>`) and runs
the whole suite inside it — the framework, browser and screen tooling all come from the
image.

## Prerequisite

The only prerequisite is a Docker-capable host (tested on Linux, macOS, Windows).

## Run it (no AutoBDD clone needed)

Clone this project, then run the baked-mode compose — it pulls the AutoBDD image and
mounts only this project:

```bash
mkdir -p ~/Projects && cd ~/Projects
git clone https://github.com/xyteam/AutoBDD-example.git
cd AutoBDD-example

export USER=$(whoami) HOSTOS=$(uname -s) USERID=$(id -u) GROUPID=$(id -g)
AutoBDD_Ver=3.0.0 ABDD_PROJECT=AutoBDD-example \
  docker compose -f docker-compose.docker.yml run --rm autobdd-example-run "make e2e-test"
```

`make e2e-test` starts the local demo-app and mock servers, then runs the whole suite
(browser + screen-image scenarios) via the AutoBDD auto-runner.

Open the searchable cucumber HTML report at
`test-results/AutoBDD-example_<timestamp>GMT/index.html`.

`AutoBDD_Ver` selects the framework image version (currently `3.0.0`).

> **Developer mode.** Drop `-f docker-compose.docker.yml` (i.e. plain
> `docker compose run …`) to run against a **local AutoBDD checkout** you are editing,
> instead of the published image — useful while developing the framework itself.

## Project layout

Test modules under `e2e-test/`, grouped by the kind of action they exercise:

- **web-page actions** — drive a real browser: `test-demoapp`, `test-browser`,
  `test-table`, `test-1nit`.
- **screen-image actions** — act on the actual screen with images/text:
  `test-screen` (image matching + OCR), `test-webpage` (live-page image/mouse actions).
- **tool actions** — non-e2e tooling as **BDD features**: API (`e2e-test/test-postman`,
  postman/newman) and jest/pytest/k6 (`e2e-test/test-tools`). Each runs its command
  directly from the feature, e.g. `When I run this command "…"` → `Then the command
  should succeed`. They run with the rest of the suite (drop `-f docker-compose.docker.yml`
  for dev mode):

```bash
export USER=$(whoami) HOSTOS=$(uname -s) USERID=$(id -u) GROUPID=$(id -g)
AutoBDD_Ver=3.0.0 ABDD_PROJECT=AutoBDD-example \
  docker compose -f docker-compose.docker.yml run --rm autobdd-example-run "make e2e-test"
```

## Make it your own

Rename this project and edit the features under `e2e-test/`; all automated by the
AutoBDD image, no framework setup required.

## Credits

Demo app and pre-canned Cucumber-JS steps adapted from
**[webdriverio/cucumber-boilerplate](https://github.com/webdriverio/cucumber-boilerplate)**.
