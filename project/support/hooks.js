// if the framework is used
var frameworkHooks;
if (process.env.FrameworkPath) {
  frameworkHooks = require(process.env.FrameworkPath + '/framework/support/hooks.js');  
} else {
  frameworkHooks = null;
}

const projectHooks = {
  // modify or add global hooks here
  BeforeFeature: function(feature) {
    if (frameworkHooks) frameworkHooks.BeforeFeature(feature);
  },

  BeforeScenario: function(scenario) {
    if (frameworkHooks) frameworkHooks.BeforeScenario(scenario);
  },

  BeforeStep: function(step) {
    if (frameworkHooks) frameworkHooks.BeforeStep(step);
  },

  AfterStep: function(step) {
    if (frameworkHooks) frameworkHooks.AfterStep(step);
  },

  AfterScenario: function(scenario) {
    if (frameworkHooks) frameworkHooks.AfterScenario(scenario);
  },

  AfterFeature: function(feature) {
    if (frameworkHooks) frameworkHooks.AfterFeature(feature);
  },

  AfterScenarioResult: function(scenario) {
    if (frameworkHooks) frameworkHooks.AfterScenarioResult(scenario);
  }
}

module.exports = projectHooks;

