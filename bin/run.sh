#!/usr/bin/env bash

APP_PATH=$(dirname $(cd $(dirname $0); pwd -P))
SCREENSHOTS_DIR="${APP_PATH}/tests/e2e/screenshots/"
S3_PATH="s3://travis-metadata/cache/MitocGroup/terraform-demo/screenshots/${JOB_NAME}/${BUILD_NUMBER}/"

function on_fail() {
    if [ -d "${SCREENSHOTS_DIR}" ]; then
        echo "Sync screenshots directory to S3 ..."
        aws s3 sync ${SCREENSHOTS_DIR} ${S3_PATH} --acl 'public-read'
    fi

    exit 1
}

echo "Running 'recink run terraform' ..."
recink run terraform -v --include-modules="ec2"
#recink run terraform -vv --include-modules="ec2" --custom-config="ec2.terraform.plan:true,ec2.terraform.apply:false,ec2.terraform.save-show-output:tfshow.txt" || on_fail
#recink run unit || on_fail
#recink run terraform --include-modules="ec2" --custom-config="ec2.terraform.plan:true,ec2.terraform.apply:true" || on_fail

#if [ -f "${APP_PATH}/ec2/.resource/terraform.tfstate.remote" ]; then
#   echo "Running 'recink run e2e' ..."
#   recink run e2e || on_fail
#else
#   echo "Skipping 'recink run e2e' ..."
#fi
