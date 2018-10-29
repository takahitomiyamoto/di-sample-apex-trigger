#!/bin/bash
readonly SCRACH_ORG_NAME=di-sample-apex-trigger

echo [START]
echo
echo scratch org を作成します ...
sfdx force:org:create -s -f config/project-scratch-def.json --loglevel DEBUG -a ${SCRACH_ORG_NAME}

echo
echo org の一覧を表示します ...
sfdx force:org:list

echo
echo ソースコードを push します ...
sfdx force:source:push -u ${SCRACH_ORG_NAME}

echo
echo scratch org へアクセスします ...
sfdx force:org:open -u ${SCRACH_ORG_NAME}

echo
echo [END]
