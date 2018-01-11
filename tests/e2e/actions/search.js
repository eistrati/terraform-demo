import { Selector, t } from 'testcafe';
import { SourceFileLoader, SourceFileParser } from '../helpers';

class Search {
  constructor(targetPath, index = 0) {
    this._targetPath = targetPath;
    this._index = index;
  }

  async targetResource(
    searchInput,
    target,
    targetPath) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
      
    await t
      .typeText(searchInput, (sourceFileParser.getResourceId(target)))
      .pressKey('enter');
  }
}

module.exports = {
  Search
}
