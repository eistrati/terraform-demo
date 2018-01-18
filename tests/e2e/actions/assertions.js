import { Selector, t } from 'testcafe';
import { SourceFileLoader, SourceFileParser } from '../helpers';

// class Assertion {
//   constructor(pathToTfstateFile, resourceTargetIndex = 0) {
//     this._pathToTfstateFile = pathToTfstateFile;
//     this._resourceTargetIndex = resourceTargetIndex;
//   }

//   async requiredArguments(
//     reqArgKey,
//     reqArgSelector,
//     resourceTarget,
//     reqArgErrorMsg) {
//     const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._pathToTfstateFile), this._resourceTargetIndex);
//     try {
//       const element = await Selector(reqArgSelector);
//       const elementText = (await element.innerText).trim();

//       await t
//         .hover(element)
//         .expect(elementText)
//         .eql(sourceFileParser.getRequiredArguments(resourceTarget, reqArgKey))
//     } catch (e) {
//       throw new Error(`${reqArgErrorMsg}`)
//     }
//   }
// }

class Assertion {
  constructor(pathToTfstateFile, resourceTargetIndex = 0) {
    this._pathToTfstateFile = pathToTfstateFile;
    this._resourceTargetIndex = resourceTargetIndex;
  }

  async requiredArguments(
    reqArgKey,
    reqArgSelector,
    resourceTarget,
    reqArgErrorMsg,
    hardcodedValue) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._pathToTfstateFile), this._resourceTargetIndex);
    try {
      const element = await Selector(reqArgSelector);
      const elementText = (await element.innerText).trim();

      await t
        .hover(element)
        .expect(elementText)
        .eql(hardcodedValue)
    } catch (e) {
      throw new Error(`${reqArgErrorMsg}`)
    }
  }
}

module.exports = {
  Assertion
}
