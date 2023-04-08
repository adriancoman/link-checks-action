const core = require('@actions/core');
const github = require('@actions/github');

try {
  // `file-to-check` input defined in action metadata file
  const nameToGreet = core.getInput('file-to-check');
  console.log(`Will look for the ${nameToGreet} file`);

  const time = (new Date()).toTimeString();
  core.setOutput("time", time);
  
  // Get the JSON webhook payload for the event that triggered the workflow
  const payload = JSON.stringify(github.context.payload, undefined, 2)
  console.log(`The event payload: ${payload}`);
  
} catch (error) {
  core.setFailed(error.message);
}