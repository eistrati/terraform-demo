import { t, Selector } from 'testcafe';
import { speed, isVisible } from '../config';
import { SourceFileLoader, SourceFileParser } from '../helpers';
import { HomePage } from '../poms/provider/webpage.po';

class Navigation {
  constructor(targetPath, index = 0) {
    this._targetPath = targetPath;
    this._index = index;
  }
  
  /**
   * Navigate to target page
   * @param {String} target
   */
  async navigateToRdsPage(target) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
    await t
      .navigateTo(`https://${sourceFileParser.getRegion(target)}.console.aws.amazon.com/rds/home?region=${sourceFileParser.getRegion(target)}#dbinstance:id=${sourceFileParser.getResourceId(target)}`)
  }
  async navigateToEc2Page(target) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
    await t
      .navigateTo(`https://${sourceFileParser.getRegion(target)}.console.aws.amazon.com/ec2/v2/home?region=${sourceFileParser.getRegion(target)}#Instances`)
  }
}

module.exports = {
  Navigation
}
