const packageJSON = require('../package.json');

if (!packageJSON.scripts.mocha) {
  packageJSON.scripts['mocha-watch'] = 'mocha --require test/setup-tests.js --recursive src/**/__specs__/*.spec.js --watch'
  packageJSON.scripts['mocha'] = 'mocha --require test/setup-tests.js --recursive src/**/__specs__/*.spec.js'
}

fs.writeFile('../package.json', JSON.stringify(packageJSON, null, 2), function (err, contents) {
  console.log("Added mocha commands");
});
