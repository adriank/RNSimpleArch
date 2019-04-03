
const packageJSONPath = process.cwd() + '/package.json'
const packageJSON = require(packageJSONPath);
const fs = require("fs");

if (!packageJSON.rnpm) {
  packageJSON['rnpm'] = {
    "assets": [
      "./assets/fonts/"
    ]
  }
}

fs.writeFile(packageJSONPath, JSON.stringify(packageJSON, null, 2), function (err, contents) {
  console.log("Added fonts");
});
