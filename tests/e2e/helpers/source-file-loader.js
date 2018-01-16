import fs from 'fs';

function SourceFileLoader(path) {
  // return Promise.resolve(require(path));
  return Promise.resolve(JSON.parse(fs.readFileSync(path, 'utf8')));
}

module.exports = {
  SourceFileLoader
}
