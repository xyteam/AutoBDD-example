process.env.PROJECTBASE = process.env.PROJECTBASE || 'test-projects';
process.env.PROJECTNAME = process.env.PROJECTNAME || process.env.PWD.split(process.env.PROJECTBASE)[1].split('/')[1]
var moduleDepth = process.env.PWD.split(process.env.PROJECTNAME)[1].split('/').length - 1
var relativePathToProject = '../'.repeat(moduleDepth)
require(relativePathToProject + 'project/support/env.js');
const projectFullPath = process.env.FrameworkPath + '/test-projects/' + process.env.ThisProject;

var moduleChimp = require(projectFullPath + '/project/support/chimp.js');
// modify or add myChimp attributes as necessary
module.exports = moduleChimp; 