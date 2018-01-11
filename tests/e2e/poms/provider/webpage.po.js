import { Selector } from 'testcafe';
import { isVisible } from '../../config';

const SignInFormIAM = {
  resolvingInput: Selector('#resolving_input', isVisible),
  nextButton: Selector('#next_button', isVisible),
  accountInput: Selector('#account', isVisible),
  usernameInput: Selector('#username', isVisible),
  passwordInput: Selector('#password', isVisible),
  signInButton: Selector('#signin_button', isVisible),
  errorMessage: Selector('.mainError', { timeout: 3000 }),
  errorMessageMfa: Selector('#mfaHeaderMessage', { timeout: 3000 })
};

module.exports = {
  SignInFormIAM
}
