// Project-level cucumber steps to run a shell command and assert on its result.
// Lets non-BDD tool tests (jest / pytest / k6) be expressed as plain BDD statements:
//
//   When I run this command "<command line>"
//   Then the command should succeed            (or: should fail)
//   And  the command output should contain "<text>"   (or: should match "<regex>")
//
// The command line carries the exact command directly (no Makefile indirection).
const { When, Then } = require('@cucumber/cucumber');
const { execSync } = require('child_process');

const RUN_TIMEOUT_MS = 15 * 60 * 1000;

function tail(text, max = 2000) {
  const s = String(text || '');
  return s.length > max ? s.slice(-max) : s;
}

When(/^I run this command "([^"]*)"$/, { timeout: RUN_TIMEOUT_MS }, function (command) {
  try {
    const stdout = execSync(command, { encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] });
    this.lastCommand = { command, status: 0, output: stdout };
  } catch (e) {
    this.lastCommand = {
      command,
      status: e.status != null ? e.status : 1,
      output: `${e.stdout || ''}${e.stderr || ''}`,
    };
  }
  console.log(`[command] exit=${this.lastCommand.status}: ${command}`);
});

Then(/^the command should (succeed|fail)$/, function (expectation) {
  const c = this.lastCommand;
  if (!c) throw new Error('no command has been run');
  if (expectation === 'succeed' && c.status !== 0) {
    throw new Error(`command expected to succeed, got exit status ${c.status}\n${tail(c.output)}`);
  }
  if (expectation === 'fail' && c.status === 0) {
    throw new Error(`command expected to fail, but it succeeded\n${tail(c.output)}`);
  }
});

Then(/^the command output should (contain|match) "([^"]*)"$/, function (mode, expected) {
  const out = (this.lastCommand && this.lastCommand.output) || '';
  const ok = mode === 'contain' ? out.includes(expected) : new RegExp(expected).test(out);
  if (!ok) {
    throw new Error(`command output did not ${mode} "${expected}"\n--- output tail ---\n${tail(out)}`);
  }
});
