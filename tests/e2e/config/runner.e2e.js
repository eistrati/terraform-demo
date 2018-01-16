import { t } from 'testcafe';
import path from 'path';
import fs from 'fs';
import { walkDir } from '../helpers/util';

const mapping = require('./mapping.json');
const sourceFiles = [];

// fixture`` is required to perform execution 

walkDir(path.join(__dirname, '../../../ec2/.resource/'), /.*terraform\.tfstate\.remote$/, (res) => {
  sourceFiles.push(res);
});

if (sourceFiles.length === 0) {
  throw new Error('There are no tftsate files available for test.');
  process.exit(1);
}

for (const targetPath of sourceFiles) {
  let tfstateObj = fs.readFileSync(targetPath, 'utf8');
  let tfstateContent = JSON.parse(tfstateObj);

  // const tfstate = require(obj);
  const sourceFileTargets = tfstateContent.modules.forEach((item, index) => {
    const resources = item.resources;
    const targets = Object.keys(resources).map((key) => {
      if (mapping.hasOwnProperty(resources[key].type)) {
        return resources[key].type;
      } else {
        console.warn(`Warning: Required test data for "${key}" resource is missing in mapping.js`);
      }
    });

    targets.forEach(key => {
      const mappingTargets = mapping[key];
      const testPath = path.join(__dirname, mappingTargets.test.path);

      if (!fs.existsSync(testPath)) {
        throw new Error(`Test script for "${key}" resource is missing in test suite`);
      }
      const test = require(testPath);
      test.run(mappingTargets.target, targetPath, index).then(res => { });
    })
  });
};
