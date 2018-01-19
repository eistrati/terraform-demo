import { t } from 'testcafe';
import { Account, speed } from '../config';
import { TextError, SelectorText } from '../helpers';
import { SignInFormIAM } from '../poms/provider/webpage.po';

class Authentication {
  constructor() { }

  async loginWithIAM() {
    return new Promise(async (resolve, reject) => {
      if (!Account.iamUserId || !Account.iamUserPassword) {
        const err = new TextError('Please enter valid account credentials!', 'AuthenticationError', 401);
        reject(err);
      }

      await t
        .typeText(SignInFormIAM.resolvingInput, Account.accountId, speed)
        .click(SignInFormIAM.nextButton, speed)
        .typeText(SignInFormIAM.usernameInput, Account.iamUserId, speed)
        .typeText(SignInFormIAM.passwordInput, Account.iamUserPassword, speed)
        .click(SignInFormIAM.signInButton, speed);

      await Promise.all([
        SelectorText(SignInFormIAM.errorMessageMfa),
        SelectorText(SignInFormIAM.errorMessage)
      ]).then(res => {
        const [mfaError, error] = res;

        if (mfaError) {
          const err = new TextError('Two factor authentication detected', 'AuthenticationError', 403);
          reject(err);
        } else if (error) {
          const err = new TextError('Please enter valid user credentials!', 'AuthenticationError', 403);
          reject(err);
        }
        resolve(null);
      });
    });
  }
};

module.exports = {
  Authentication
}
