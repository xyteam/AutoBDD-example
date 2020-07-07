require('./support/env.js');
var moduleAbdd = require(`${process.env.PROJECTRUNPATH}/${process.env.TestDir}/support/abdd.js`);
// online mode is needed for test-init to download drivers
moduleAbdd.config.baseUrl = 'http://localhost:8082';
// modify or add myAbdd attributes as necessary
module.exports = moduleAbdd;