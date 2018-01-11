const path = require('path');
const fs = require('fs');

/**
 * @param {String} dir 
 * @param {Regex} filter 
 * @param {Function} callback 
 */
function walkDir(dir, filter, callback) {
  if (!fs.existsSync(dir)) {
    return;
  }

  let files = fs.readdirSync(dir);

  for (let i = 0; i < files.length; i++) {
    let filename = path.join(dir, files[i]);
    let stat = fs.lstatSync(filename);

    if (stat.isDirectory()) {
      walkDir(filename, filter, callback);
    } else if (filter.test(filename)) {
      callback(filename);
    }
  }
}

module.exports = {
  walkDir
} 
