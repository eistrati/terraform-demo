'use strict';

const { Selector } = require('testcafe');
const url = 'http://aws-s3-bucket-as-website-for-terraform-demo.s3-website-us-east-1.amazonaws.com/';

fixture('"demo-bucket" module').page(url);

test('Check if website is available', async t => {
  const h1 = await Selector('h1').textContent;
  await t.expect(h1).eql('404 Not Found')
});
