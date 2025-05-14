# Error Demonstration for type-fest

When type-fest version is greater than 4.0.0, it will report an error in the export default scenario.


## Prerequisites

Make sure you have TypeScript installed globally:

```sh
npm install -g typescript
```

To get the error yourself, run the following on a clean repository:

```sh
cd ./lib && \
npm ci && \
npm link --userconfig ../.npmrc && \
tsc -p tsconfig.json && \
npm pack && \
cd ../project && \
npm i "../lib/""$PACK_FILENAME" && \
npm link @demonstration/lib --userconfig ../.npmrc

tsc -p tsconfig.json
```

Or more simply, if you trust the shell script provided, run `./test.sh`.