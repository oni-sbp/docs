#!/usr/bin/env bash
set -exuo pipefail

git clone https://oni-sbp:$GH_PASSWORD@github.com/oni-sbp/CodeGen-Code.git

cd CodeGen-Code
npm install

cd doc-generation
cp -r lib ../docs/raml2markdown/oas-raml-converter/
cd ..

cd docs
bundle install

cd raml2markdown

npm install
npm install swagger-to-slate

cd oas-raml-converter
npm install

cd ..
cd ..
cd ..

cd doc-generation
cp -r src ../docs/raml2markdown/node_modules/swagger-to-slate
cd ..

cd resources
mkdir Temp-Files
cd ..

node API-Engine-cmd.js --input ./docs/raml2markdown/src --output ../build --host $HOST --scheme $SCHEME

ls -R resources/Temp-Files

sudo apt-get update
sudo apt-get install tree
tree resources/Temp-Files/
