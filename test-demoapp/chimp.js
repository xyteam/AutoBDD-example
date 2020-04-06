require('./support/env.js')
var moduleChimp = require(process.env.PROJECTRUNPATH + '/project/support/chimp.js');
// modify or add myChimp attributes as necessary
moduleChimp.webdriverio.baseUrl = `http://${process.env.DemoAppHost}:8082`
module.exports = moduleChimp; 
