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

Step 1: Checkout the AutoBDD-example project:
```
mkdir -p ~/Projects; cd ~/Projects; \
git clone https://github.com/xyteam/AutoBDD-example.git;
```
Step 2: Run test:
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

Step 3: Review test report

A folder named **bdd_reports** will be created under the test project. Inside this folder you will find a datetime stamped test-run report folder for each test-run. Report folder can be exposed by a http-server, and can be archived into a zip file and download for local browser viewing.

### additional notes on the report folder:

* The HTML file cucumber-report.json.html can be opened by a web browser directly.

* The JSON file cucumber-report.json can be used for other reporting tools.

* The sub-folders correspond to the sub-folders (grouping) of the test project.

Inside each sub-folder:

* The .RUN files are the run logs for each test scenarios (test case).

* The .JPG files are the final screenshot for the test scenario.

* The .MP4 files are the movie for the test scenario (run with --movie=1 option)

### To run import test results into TestRail:
Yes, this framework integrates with TestRail seamlessly.

Teh below step demostrates the possibility to import the cucumber-report JSON file to other reporting tools.

To add testcases only:
```
trApiUrl=http://your.testrail.url \
trApiUser=your_testrail_user \
trApiKey=your_testrail_key \
~/Projects/AutoBDD/framework/scripts/testrail \
--trProjectId=testrail_project_id \
--trCmd cbAddCases \
--cbJsonPath /path/to/cucumber-report.json \
--forceAdd \
--forceUpdate \
```

To add/update test cases and test-run results:
```
substitute the trCmd option with:
--trCmd cbUpdateResults \
```

### To develop debug and develop test

To debug and develop test you will need a local PC with:

* a IDE or Editor to update test,

* a terminal to run test (some IDE comes with a terminal),

* a VNC client to observe test visually.

Step 1: Check out test project (same as above)

Step 2: Bring up test-dev docker container:
```
cd AutoBDD-example/docker; \
docker-compose up -d test-dev
```

Step 3: Access container GUI console at docker-host vnc port 5901

Step 4: Access container bash through ssh port 2222: ssh -o "StrictHostKeyChecking=no" $(whoami)@docker-host -p 2222

where in step 3 and 4 the docker-host can be:

* docker-host IP or FDQN if the docker-host is a remote or cloud computer

* localhost or 127.0.0.1 if the docker-host is your local Linux or MacOS

* "docker-machine ip" output if the docker provider is a Windows with docker-tools

Step 5: Run test:
```
cd test-webpage
chimpy
or
chimpy --name "partial test name or regex"
or
chimpy features/file_name:line_num
or
chimpy --tags @cucumberTag
```
chimpy command can be prepanded with environment variables
```
SCREENSHOT=1 myWebPassword=abc123 chimpy
```

Step 6: Update test or write new test

### To turn this project into your own:

Step 1: git clone this project

Step 2: rm -rf the .git directory

Step 3: rename this project to your own

Step 4: rename/remove test-xxxx modules (sub folders)

Step 5: rename/remove *.feature files inside the features folder of each test-xxxx sub folder

Step 6: git init and check-in this project to your git repo

That's basically it. You can starting writing feature files and test scenarios.

### Additional tchnical information (for advanced users)

This project follows Cucumber-JS convention. You can take control in the order of

test-module => project => framework

where framework and project level influences all test-xxxx module level, and test-xxxx module level only influences self.

You will (and should) see the following files the project/ folder and each test-xxxx folder. Folders may not exists in the beginning, but you can create them if you start to have files inside the folders.

* chimp.js # defines system

* env.js

* world.js

* hooks.js

* support/steps/ # your own test steps if not provided by the framework

* support/testimages/ # test images, framework will automatically search these folders for test images (see Test Image Note below)

* support/webelements/ # page object to be used by your own test steps

**Test Image Note**:

* Test images can be in png, jpg and gid formats.

* Only include the filename (without the extension) in test statements that require image input.

* The framework will automatically scan the testimages/ folder in the order of test-xxxx => project => framework for the taret test image to satisfy the image statement.

**Test Image Clipping Note** 

* Write your test statement with the intended name of the test image.

* In ssh terminal run chimpy command with SCREENSHOT=1 or MOVIE=1 prefix.

* The test will will fail at the image statement and leave a screenshot in the current directory.

* In ssh terminal use "google-chrome . &" command to display the screenshot at the VNC GUI console and expand the size to full 100%.

* In ssh terminal, cd to target testimages/ folder, and run command "import filename.jpg" (it is important to specify .jpg extension here. use .png extension will capture a png image but cannot be used).

* In the VNC GUI console use mouse to clip the relavent portion, once you release the mouse the image file will be saved automatically.

* Re-run the same test to verify the test image can indeed pass the test. Re-clip test image as needed.

### Special Mentions
  * Demo-App application and Precanned Cucumber-JS Steps are taken from **[webdriverio/cucumber-boilerplate](https://github.com/webdriverio/cucumber-boilerplate)**
