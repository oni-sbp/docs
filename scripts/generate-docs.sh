#!/usr/bin/env bash
set -exuo pipefail

git clone https://oni-sbp:$GH_PASSWORD@github.com/oni-sbp/CodeGen-Code.git

cd CodeGen-Code
npm install

cd docs
bundle install

cd raml2markdown
ls
npm install
npm install swagger-to-slate
ls
ls node_modules
cd oas-raml-converter
npm install

cd ..
cd ..
cd ..
cd doc-generation
cp -r src ../docs/raml2markdown/node_modules/swagger-to-slate

cd ..

#node API-Engine-cmd.js --input ./raml2markdown/src --output ./build --host $HOST --scheme $SCHEME
