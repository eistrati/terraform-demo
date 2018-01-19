import { t, Selector } from 'testcafe';
import { speed, isVisible } from '../config';
import { HomePage } from '../poms/provider/webpage.po';

class Navigation {
  constructor() {
  }
  
  async navigateTo(testData, serviceName, urlPostFix) {
    await t
      .navigateTo(`https://${testData.region}.console.aws.amazon.com/${serviceName}/home?region=${testData.region}#${urlPostFix}:`)
  }
}

module.exports = {
  Navigation
}
