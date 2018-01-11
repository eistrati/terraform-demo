const chai = require('chai');
let fs = require('fs');
let path = require('path');

describe('Terraform show log assertion', () => {
  it('Test terraform show log should fail if contains "forces-new-resources" keyword', () => {
    let data = fs.readFileSync(path.resolve(__dirname, '../../../rds_restore/.resource/terraform-show.txt'));
    chai.expect(data.toString(),  '"forces-new-resources" keyword is detected in terraform show log').not.to.have.string('forces-new-resources')
  });
});