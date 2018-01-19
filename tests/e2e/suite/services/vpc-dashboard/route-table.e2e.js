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
  return item.type === 'aws_route_table'
}).forEach(testData => {

  fixture`Performing test for ${testData.type} resource`
    .page`${Environment.iamUrl}`

  test(`${testData.type} resource values in UI are matched with input test data`, async t => {
    await authentication.loginWithIAM();
    await navigation.navigateTo(
      testData, 
      config.vpc_dashboard.resources[testData.type].urlPreFix, 
      config.vpc_dashboard.resources[testData.type].urlPostFix);
    await search.targetResource(
      testData, 
      config.vpc_dashboard.selectors.searchInput);
    await assertion.requiredArguments(
      testData.id, 
      config.vpc_dashboard.selectors.id, 
      config.vpc_dashboard.resources[testData.type].idErrorMsg)
  })
});
