import { Selector, t } from 'testcafe';

class Search {
  constructor() {}

  async targetResource(testData, searchSelector) {  
    const searchInputSelector = Selector(searchSelector);
    
    await t
      .typeText(searchInputSelector, testData.id)
      .pressKey('enter');
  }
}

module.exports = {
  Search
}
