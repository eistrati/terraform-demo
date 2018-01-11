function SourceFileLoader(path) {
  return Promise.resolve(require(path));
}

module.exports = {
  SourceFileLoader
}
