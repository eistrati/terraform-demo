const chai = require('chai');
let fs = require('fs');
let path = require('path');

describe('Terraform show result assertion', () => {
  it('Assertion of terraform show should fail if contains "forces new resource" or "new resource required"', () => {
    let data = fs.readFileSync(path.resolve(__dirname, '../../../ec2/.resource/tfshow.txt'));
    chai.expect(data.toString(), '"new resource required" is detected in terraform show log').not.to.have.string('new resource required');
    chai.expect(data.toString(), '"forces new resource" is detected in terraform show log').not.to.have.string('forces new resource');
  });
});
