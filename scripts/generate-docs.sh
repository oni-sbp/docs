#!/usr/bin/env bash
set -exuo pipefail 

git clone https://oni-sbp:$GH_PASSWORD@github.com/oni-sbp/CodeGen-Code.git

cd CodeGen-Code
npm install

cp -r doc-generation/lib ./docs/raml2markdown/oas-raml-converter/

cd docs
bundle install

cd raml2markdown
npm install
npm install swagger-to-slate

cd ../..

cp -r doc-generation/src ./docs/raml2markdown/node_modules/swagger-to-slate

mkdir resources/Temp-Files

node API-Engine-cmd.js --input ./docs/raml2markdown/src --output ../build --host $HOST --scheme $SCHEME

cat resources/Temp-Files/*/OAS/acl.json

sudo apt-get update
sudo apt-get install tree
tree resources/Temp-Files/
