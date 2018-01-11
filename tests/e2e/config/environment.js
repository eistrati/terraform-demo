import { TextError } from '../helpers';

/**
 * @param {Array<String>} args 
 */
function validateGlobals(args) {
  for (let arg of args) {
    if (!process.env.hasOwnProperty(arg) || process.env[arg] === '') {
      throw new TextError(`Missing ${arg} value`, 'Pre-requisites Error');
    }
  }
}

/**
 * @returns {Object}
 */
function Account() {
  validateGlobals(['AWS_ACCOUNT_ID', 'AWS_IAM_USER_ID', 'AWS_IAM_USER_PWD']);

  return {
    accountId: process.env.AWS_ACCOUNT_ID,
    iamUserId: process.env.AWS_IAM_USER_ID,
    iamUserPassword: process.env.AWS_IAM_USER_PWD
  }
}

/**
 * @returns {Object}
 */
function Environment() {
  validateGlobals(['AWS_DEFAULT_REGION']);
  const defaultRegion = process.env.AWS_DEFAULT_REGION;

  return {
    iamUrl: `https://console.aws.amazon.com/console/home?region=${defaultRegion}#Instances`,
  }
}

module.exports = {
  Account: Account(),
  Environment: Environment()
}