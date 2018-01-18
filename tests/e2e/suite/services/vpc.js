import { t } from 'testcafe';
import { Authentication, Navigation, Search, Assertion } from '../../actions';
import { Environment } from '../../config/environment';

const hardcodedValue = "vpc-a0c91fc5";
const authentication = new Authentication();
const mapping = require('../../config/mapping.json');
const serviceName = mapping.aws_vpc.service
const serviceNamePostfix = mapping.aws_vpc.serviceNamePostfix
const searchInputSelector = mapping.aws_vpc.test.requiredArguments.search.selector
const idReqArgObj = mapping.aws_vpc.test.requiredArguments.id;
const idKey = idReqArgObj.key;
const idSelector = idReqArgObj.selector;
const idErrorMsg = idReqArgObj.message;
const statusReqArgObj = mapping.aws_vpc.test.requiredArguments.status;
const statusKey = statusReqArgObj.key;
const statusSelector = statusReqArgObj.selector;
const statusErrorMsg = statusReqArgObj.message;

function run(resourceTarget, pathToTfstateFile, resourceTargetIndex) {
  return new Promise((resolve, reject) => {
    const navigation = new Navigation(pathToTfstateFile, resourceTargetIndex);
    const search = new Search(pathToTfstateFile, resourceTargetIndex);
    const assertion = new Assertion(pathToTfstateFile, resourceTargetIndex);

    fixture`Performing test for ${resourceTarget} resource`
      .page`${Environment.iamUrl}`

    test(`${resourceTarget} resource values in UI are matched with parsed tfstate file`, async t => {
      await authentication.loginWithIAM();
      await navigation.navigateTo(serviceName, resourceTarget, serviceNamePostfix);
      await search.targetResource(searchInputSelector, resourceTarget, hardcodedValue)
      await assertion.requiredArguments(idKey, idSelector, resourceTarget, idErrorMsg, hardcodedValue);
      // await assertion.requiredArguments(statusKey, statusSelector, resourceTarget, statusErrorMsg);
    });

    return resolve();
  });
};

module.exports = {
  run
} 
