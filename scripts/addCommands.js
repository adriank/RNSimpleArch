const packageJSONPath = process.cwd() + '/package.json'
const packageJSON = require(packageJSONPath);
const fs = require("fs");

if (!packageJSON.scripts.mocha) {
  packageJSON.scripts['mocha-watch'] = 'mocha --require test/setup-tests.js --recursive src/**/__specs__/*.spec.js --watch'
  packageJSON.scripts['mocha'] = 'mocha --require test/setup-tests.js --recursive src/**/__specs__/*.spec.js'
}

fs.writeFile(packageJSONPath, JSON.stringify(packageJSON, null, 2), function (err, contents) {
  console.log("Added mocha commands");
});
