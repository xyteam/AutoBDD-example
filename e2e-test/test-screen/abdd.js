const path = require('path');
// framework level env vars
require(process.env.FrameworkPath + '/framework/support/env.js');
process.env.TestDir = path.resolve(__dirname).split(process.env.PROJECTNAME)[1].split('/')[1];
process.env.TestModule = path.resolve(__dirname).split(process.env.PROJECTNAME)[1].split('/')[2];
// project level env vars
require(`${process.env.PROJECTRUNPATH}/${process.env.TestDir}/support/env.js`);
// module level env vars
require(path.resolve(__dirname) + '/support/env.js');
var moduleAbdd = require(`${process.env.PROJECTRUNPATH}/${process.env.TestDir}/support/abdd.js`);
// Screen-actions module: run against the locally installed browser's version page so
// the image/OCR checks are self-hosted (no external site needed).
moduleAbdd.baseUrl = 'chrome://version';
if (moduleAbdd.config) moduleAbdd.config.baseUrl = 'chrome://version';
module.exports = moduleAbdd;
