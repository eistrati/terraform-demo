import { t } from 'testcafe';
import { Authentication, Navigation, Search, Assertion } from '../../actions';
import { Environment } from '../../config/environment';

const authentication = new Authentication();
const navigation = new Navigation();
const search = new Search();
const assertion = new Assertion();

const testData = require('../../config/test-data.js');
const mapping = require('../../config/mapping.json');

testData.filter(item => {
  return item.type === 'vpc'
}).forEach(testData => {

  fixture`Performing test for ${testData.type} resource`
    .page`${Environment.iamUrl}`

  test(`${testData.type} resource values in UI are matched with input test data`, async t => {
    await authentication.loginWithIAM();
    await navigation.navigateTo(testData, mapping.aws_vpc.urlPosFix);
    await search.targetResource(testData, mapping.aws_vpc.searchSelector);
    await assertion.requiredArguments(
      testData.id, 
      mapping.aws_vpc.requiredArguments.id.selector, 
      mapping.aws_vpc.requiredArguments.id.errorMessage)
    await assertion.requiredArguments(
      testData.status, 
      mapping.aws_vpc.requiredArguments.status.selector, 
      mapping.aws_vpc.requiredArguments.status.errorMessage
    );
  })
});
