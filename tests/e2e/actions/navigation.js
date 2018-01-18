import { t, Selector } from 'testcafe';
import { speed, isVisible } from '../config';
import { SourceFileLoader, SourceFileParser } from '../helpers';
import { HomePage } from '../poms/provider/webpage.po';

class Navigation {
  constructor(pathToTfstateFile, resourceTargetIndex = 0) {
    this._pathToTfstateFile = pathToTfstateFile;
    this._resourceTargetIndex = resourceTargetIndex;
  }
  
  async navigateTo(serviceName, resourceTarget, serviceNamePostfix) {
    const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._pathToTfstateFile), this._resourceTargetIndex);
    await t
      .navigateTo(`https://${sourceFileParser.getRegion(resourceTarget)}.console.aws.amazon.com/${serviceName}/home?region=${sourceFileParser.getRegion(resourceTarget)}#${serviceNamePostfix}`)
  }

  // async navigateToRdsPage(target) {
  //   const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
  //   await t
  //     .navigateTo(`https://${sourceFileParser.getRegion(target)}.console.aws.amazon.com/rds/home?region=${sourceFileParser.getRegion(target)}#dbinstance:id=${sourceFileParser.getResourceId(target)}`)
  // }
  // async navigateToEc2Page(target) {
  //   const sourceFileParser = new SourceFileParser(await SourceFileLoader(this._targetPath), this._index);
  //   await t
  //     .navigateTo(`https://${sourceFileParser.getRegion(target)}.console.aws.amazon.com/ec2/v2/home?region=${sourceFileParser.getRegion(target)}#Instances`)
  // }
}

module.exports = {
  Navigation
}
