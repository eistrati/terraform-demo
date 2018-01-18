import { Selector, t } from 'testcafe';

class Assertion {
  constructor() { }

  async requiredArguments(testData, selector, errorMessage) {
    try {
      const element = await Selector(selector);
      const elementText = (await element.innerText).trim();

      await t
        .hover(element)
        .expect(elementText)
        .eql(testData)
    } catch (e) {
      throw new Error(`${errorMessage}`)
    }
  }
}

module.exports = {
  Assertion
}
