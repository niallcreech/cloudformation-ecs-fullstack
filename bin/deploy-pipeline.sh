#!/bin/bash
set -x
WORK_DIR="."
TMP_DIR="/tmp"
TEMPLATE=pipeline-to-service-catalog.yaml
S3_BUCKET=cf-templates-1mjan0rcjtrzk-eu-west-1
STACK_NAME='pipeline-to-service-catalog'
if [ -z $1 ]; then
    COMMAND="create-stack"
else
    COMMAND=$1
fi

aws cloudformation package --template-file ${WORK_DIR}/${TEMPLATE} --s3-bucket=${S3_BUCKET} > ${TMP_DIR}/${STACK_NAME}-output.template

aws cloudformation ${COMMAND} \
--stack-name ${STACK_NAME} \
--capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM  CAPABILITY_AUTO_EXPAND \
--template-body file://${TMP_DIR}/${STACK_NAME}-output.template \
--parameters \
ParameterKey=RepositoryName,ParameterValue="aws-cloudformation-stacks" \
ParameterKey=BranchName,ParameterValue="master" \
ParameterKey=RepositoryOwner,ParameterValue="niallcreech"
