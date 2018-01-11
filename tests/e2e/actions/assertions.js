import { Selector, t } from 'testcafe';
import { SourceFileLoader, SourceFileParser } from '../helpers';

class Assertion {
  constructor(targetPath, index = 0) {
    this._targetPath = targetPath;
    this._index = index;
  }

  async requiredArguments(
    reqArgKey,
    reqArgSelector,
    target,
    reqArgMsg,
    targetPath) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
    try {
      
    await t  
      const element = await Selector(reqArgSelector);
      const elementText = (await element.innerText).trim();

      await t
        .hover(element)
        .expect(elementText)
        .eql(sourceFileParser.getRequiredArguments(target, reqArgKey))
    } catch (e) {
      throw new Error(`${reqArgMsg}`)
    }
  }
}

module.exports = {
  Assertion
}
