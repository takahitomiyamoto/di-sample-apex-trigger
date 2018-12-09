#!/bin/bash

echo [START]
echo
echo manifestファイルを作成します ...
sfdx force:source:convert -d manifest/

echo manifestファイル以外を削除します ...
rm -r ./manifest/classes/
rm -r ./manifest/customMetadata/
rm -r ./manifest/layouts/
rm -r ./manifest/objects/
rm -r ./manifest/profiles/
rm -r ./manifest/triggers/

echo
echo [END]
