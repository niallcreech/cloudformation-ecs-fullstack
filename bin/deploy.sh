#!/bin/bash
set -x
WORK_DIR="$(PWD)/portfolios/sevenmachines.org/templates"
TMP_DIR="/tmp"
TEMPLATE=eks.template
S3_BUCKET=cf-templates-1mjan0rcjtrzk-eu-west-1
AMI=ami-0a9006fb385703b54
STACK_NAME='eks'
if [ -z $1 ]; then
    COMMAND="create-stack"
else
    COMMAND=$1
fi

aws cloudformation package --template-file ${WORK_DIR}/${TEMPLATE} --s3-bucket=${S3_BUCKET} > ${TMP_DIR}/output.template

aws cloudformation ${COMMAND} \
--stack-name eks \
--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
--template-body file://${TMP_DIR}/output.template \
--parameters \
ParameterKey=KeyName,ParameterValue="cryoaws-mini" \
ParameterKey=EnableCluster,ParameterValue="true" \
ParameterKey=EnableNodeGroups,ParameterValue="true"
