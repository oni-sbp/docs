#!/usr/bin/env bash
set -exuo pipefail

git clone https://oni-sbp:$GH_PASSWORD@github.com/oni-sbp/CodeGen-Code.git

cd CodeGen-Code
npm install

cd docs
bundle install

cd raml2markdown
npm install

cd oas-raml-converter
npm install

node API-Engine-cmd.js --input ./raml2markdown/src --output ./build --host $HOST --scheme $SCHEME
