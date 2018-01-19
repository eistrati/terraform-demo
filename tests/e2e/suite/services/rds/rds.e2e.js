import { t } from 'testcafe';
import { Authentication, Navigation, Search, Assertion } from '../../../actions';
import { Environment } from '../../../config/environment';

const authentication = new Authentication();
const navigation = new Navigation();
const search = new Search();
const assertion = new Assertion();

const inputData = require('../../../config/test-data.js');
const config = require('../../../config/config.json');

inputData.filter(item => {
  return item.type === 'aws_db_instance'
}).forEach(testData => {

  fixture`Performing test for ${testData.type} resource`
    .page`${Environment.iamUrl}`

  test(`${testData.type} resource values in UI are matched with input test data`, async t => {
    await authentication.loginWithIAM();
    await navigation.navigateTo(
      testData, 
      config.rds.resources[testData.type].urlPreFix, 
      config.rds.resources[testData.type].urlPostFix);
    await search.targetResource(
      testData, 
      config.rds.selectors.searchInput);
    await assertion.requiredArguments(
      testData.id, 
      config.rds.selectors.id, 
      config.rds.resources[testData.type].idErrorMsg)
    await assertion.requiredArguments(
      testData.status, 
      config.rds.selectors.status, 
      config.rds.resources[testData.type].statusErrorMsg)
  })
});
