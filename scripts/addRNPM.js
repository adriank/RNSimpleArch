const packageJSON = require('../package.json');
const fs = require("fs");

if (!packageJSON.rnpm) {
  packageJSON['rnpm'] = {
    "assets": [
      "./assets/fonts/"
    ]
  }
}

fs.writeFile('../package.json', JSON.stringify(packageJSON, null, 2), function (err, contents) {
  console.log("Added fonts");
});
