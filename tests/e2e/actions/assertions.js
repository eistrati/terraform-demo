import { Selector, t } from 'testcafe';
import { SourceFileLoader, SourceFileParser } from '../helpers';

class Assertion {
  constructor(targetPath, index = 0) {
    this._targetPath = targetPath;
    this._index = index;
  }

  /**
   * Compare resource ID value between source file and web page UI
   * @param {String} idSelector 
   * @param {String} target 
   * @param {String} idCheckFailMsg 
   */
  
  async requiredArguments(
    reqArgKey,
    reqArgSelector, 
    target, 
    reqArgMsg, 
    targetPath) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
    try {
      await t
        .hover(Selector(reqArgSelector))
        .expect(Selector(reqArgSelector).innerText)
        .eql(sourceFileParser.getRequiredArguments(target, reqArgKey))
    } catch (e) {
      throw new Error(`${reqArgMsg}`)
    }
  }
}

module.exports = {
  Assertion
}
