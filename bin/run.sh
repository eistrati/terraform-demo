#!/usr/bin/env bash
APP_PATH=$(dirname $(cd $(dirname $0); pwd -P))
SCREENSHOTS_DIR="${APP_PATH}/tests/e2e/screenshots/"
S3_PATH="s3://travis-metadata/cache/MitocGroup/terraform-demo/screenshots/${JOB_NAME}/${BUILD_NUMBER}/"

on_fail() {
    if [ -d "${SCREENSHOTS_DIR}" ]; then
        echo "Sync screenshots directory to S3 ..."
        aws s3 sync ${SCREENSHOTS_DIR} ${S3_PATH} --acl 'public-read'
    fi

    exit 1
}

echo "Running 'recink run terraform' ..."
recink run terraform --include-modules="rds_restore" --custom-config="rds_restore.terraform.plan:true,rds_restore.terraform.apply:false,rds_restore.terraform.save-show-output:terraform-show.txt" || on_fail
recink run unit || on_fail
recink run terraform --include-modules="rds_restore" --custom-config="rds_restore.terraform.plan:false,rds_restore.terraform.apply:true" || on_fail

TF_STATE=${APP_PATH}/rds_restore/.resource/terraform.tfstate
if [ -f ${TF_STATE} ]; then
   echo "Copying .tfstate files to tests directory"
   mkdir -p ${APP_PATH}/tests/e2e/rds_restore/.resource/
   cp ${TF_STATE} ${APP_PATH}/tests/e2e/rds_restore/.resource/terraform.tfstate.json
   echo "Running 'recink run e2e' ..."
   recink run e2e || on_fail
else
   echo "Skipping 'recink run e2e' ..."
fi