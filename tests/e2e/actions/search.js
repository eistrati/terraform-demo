import { Selector, t } from 'testcafe';
import { SourceFileLoader, SourceFileParser } from '../helpers';

// class Search {
//   constructor(pathToTfstateFile, resourceTargetIndex = 0) {
//     this._pathToTfstateFile = pathToTfstateFile;
//     this._resourceTargetIndex = resourceTargetIndex;
//   }

//   async targetResource(searchInputSelector, resourceTarget) {
//     const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._pathToTfstateFile), this._resourceTargetIndex);
      
//     await t
//       .typeText(searchInputSelector, (sourceFileParser.getResourceId(resourceTarget)))
//       .pressKey('enter');
//   }
// }

class Search {
  constructor(pathToTfstateFile, resourceTargetIndex = 0) {
    this._pathToTfstateFile = pathToTfstateFile;
    this._resourceTargetIndex = resourceTargetIndex;
  }

  async targetResource(searchInputSelector, resourceTarget, hardcodedValue) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._pathToTfstateFile), this._resourceTargetIndex);
      
    await t
      .typeText(searchInputSelector, hardcodedValue)
      .pressKey('enter');
  }
}

module.exports = {
  Search
}
