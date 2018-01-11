Terraform demo integrated with CI & CD pipeline
===============================================

# Prerequisites

- [x] Git >= v1.x
- [x] Node.js >= v6.x
- [x] NPM >= v3.x
- [x] [REciNK](https://github.com/MitocGroup/recink#installation)


# Installation

- `npm install -g recink`
- `npm install -g recink-terraform`

# Local Usage

- Clone the example `git clone git@github.com:MitocGroup/terraform-demo.git`
- Run `AWS_DEFAULT_REGION='us-west-2' AWS_ACCESS_KEY_ID='xxx' AWS_SECRET_ACCESS_KEY='xxx' recink run terraform terraform-demo/ -s cache`
