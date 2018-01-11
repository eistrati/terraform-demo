/**
 * Check for message exists 
 * @return {false | string}
 */
function SelectorText(selector) {
  return selector.innerText.then(errorText => {
    return errorText;
  }).catch(() => {
    return false;
  });
};

module.exports = {
  SelectorText
}
