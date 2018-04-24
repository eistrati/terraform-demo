'use strict';

const fs = require('fs');
const path = require('path');

describe('"demo-bucket" module', () => {
  it('Check if plan saved its output', () => {
    const outputPath = path.join(__dirname, '../../bucket/.resource/tfshow.txt');
    console.assert(fs.existsSync(outputPath), 'tfshow.txt does not exist');
  });
});
