import { t, Selector } from 'testcafe';
import { speed, isVisible } from '../config';
import { HomePage } from '../poms/provider/webpage.po';

class Navigation {
  constructor() {
  }
  
  async navigateTo(testData, urlPosFix) {
    await t
      .navigateTo(`https://${testData.region}.console.aws.amazon.com/${testData.type}/home?region=${testData.region}#${urlPosFix}`)
  }
}

module.exports = {
  Navigation
}
