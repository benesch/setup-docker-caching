const core = require("@actions/core");
const child_process = require("child_process");
const path = require("path");

core.exportVariable("ACTIONS_CACHE_URL", process.env.ACTIONS_CACHE_URL);
core.exportVariable("ACTIONS_RUNTIME_TOKEN", process.env.ACTIONS_RUNTIME_TOKEN);

child_process.execSync(path.join(__dirname, "setup.sh"), {
    stdio: "inherit",
});
