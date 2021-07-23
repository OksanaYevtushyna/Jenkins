#!/usr/bin/env bash

FILE=./node_modules/google-closure-compiler-osx
if [ -d "$FILE" ]; then
    echo "Running OSX compiler"
else
    echo "Running linux compiler"
    FILE=./node_modules/google-closure-compiler-linux
fi

npm run tsc &&
$FILE/compiler \
--language_in ECMASCRIPT_2017 \
--js_output_file="cypress/sandbox/build/beacon.min.js" \
--language_out ES5_STRICT \
--module_resolution NODE \
--assume_function_wrapper true \
--output_wrapper='(function(){%output%}).call({})' \
--dependency_mode PRUNE \
--entry_point='./dist/src/beacon.js' \
--compilation_level='ADVANCED_OPTIMIZATIONS' \
--externs ./src/externs.js \
--js ./dist/src/beacon.js \
./dist/src/**/**/*.js \
./dist/src/**/*.js \
./dist/config.js \
"node_modules/@connect/**/package.json" \
"node_modules/@connect/**/*.js"
