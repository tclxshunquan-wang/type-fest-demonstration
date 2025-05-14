#!/usr/bin/env bash

TSC_VERSION="$(tsc -v)"
PACK_FILENAME="demonstration-lib-1.0.0.tgz"

echo "tsc version! (tsc -v)"

if [ -d "lib/dist" ]; then
    echo "cleaning up"
    rm "./lib/dist" && \
    rm "./lib/node_modules" && \
    rm "./lib/""$PACK_FILENAME" && \
    rm "./project/dist" && \
    rm "./project/node_modules"
fi

echo "Installing dependencies"

cd ./lib && \
npm ci && \
npm link --userconfig ../.npmrc && \
tsc -p tsconfig.json && \
npm pack && \
cd ../project && \
npm i "../lib/""$PACK_FILENAME" && \
npm link @demonstration/lib --userconfig ../.npmrc

tsc -p tsconfig.json

RES="$?"

if [ ! "$RES" = "0" ]; then
    echo "Successfully demonstrated failure!"
    exit "$RES"
fi