### TLDR:

```
mkdir -p ~/Projects; cd ~/Projects; \
git clone https://github.com/xyteam/AutoBDD-example.git; \
cd ~/Projects/AutoBDD-example/docker
docker-compose run --rm test-run "--movie 1 --argstring '--tags @Demo'"
```
Open the HTML BDD test report in ~/Projects/AutoBDD-example/bdd_reports/

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

### To run example test in 3 simple steps:

To run test you only need a docker supporting headless host somewhere on the network.

#### Step 1: Checkout the AutoBDD-example project:
```
mkdir -p ~/Projects; cd ~/Projects; \
git clone https://github.com/xyteam/AutoBDD-example.git;
```
#### Step 2: Run test:
```
cd AutoBDD-example/docker; \
# to run test cases with @Demo tag
docker-compose run --rm test-run "--movie 1 --argstring '--tags @Demo'"
```
Options can be appended with quotes to the run command above.
```
"--help"
"--modulelist test-download test-postman --movie 1 --reportbase /some/folder --reportpath someName --argstring '--tags @Demo,@SmokeTest --tags ~@wip'"
```

#### Step 3: Review test report

A folder named **bdd_reports** will be created under the test project.
Each run creates a timestamped folder with a HTML report and all the run log as well as screenshots and movie.

### Special Mentions
  * Demo-App application and Precanned Cucumber-JS Steps are taken from **[webdriverio/cucumber-boilerplate](https://github.com/webdriverio/cucumber-boilerplate)**
