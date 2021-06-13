## eslint
https://eslint.org/  
`/* eslint-disable-line no-labels  */`  
`/* global page */`  

## git
Excluding a file from a git diff `git diff -- ':!**./excludeme.js'`  

## vscode
using **jsconfig** : https://code.visualstudio.com/docs/languages/jsconfig  
using **editorconfig** : https://editorconfig.org/  

### plugins
**editorconfig** support https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig  
viewing git changes plugin **GitGraph** : https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph  
common **coding standards** : https://marketplace.visualstudio.com/items?itemName=standard.vscode-standard  

## npm
https://nodejs.org/  
https://www.npmjs.com/  

### plugins
**trash-cli** : github.com/sindresorhus/trash-cli  
**standard** : https://github.com/standard/standard  
**npm-run-all** : github.com/mysticatea/npm-run-all  

## rollup
https://github.com/rollup/rollup  and https://rollupjs.org/guide/en/  

### plugins
**@rollup/plugin-strip** : https://github.com/rollup/plugins/tree/master/packages/strip  
**rollup-plugin-terser** : https://github.com/TrySound/rollup-plugin-terser  

## testing

### documentation
**jest** : https://jestjs.io/   
mocking: https://jestjs.io/docs/mock-functions  
puppeteer: https://devdocs.io/puppeteer/   

### setup
**@babel/preset-env** : https://babeljs.io/docs/en/babel-preset-env  
**puppeteer** : https://github.com/smooth-code/jest-puppeteer/tree/master and https://github.com/puppeteer/puppeteer   https://pptr.dev/    
**http-server** : https://github.com/http-party/http-server  

**jest** requires a **babel** config in `package.json`  
```
  "babel": {
    "presets": [
      [
        "@babel/preset-env",
        {
          "modules": "auto",
          "targets": {
            "node": "current"
          }
        }
      ]
    ]
  }
```
and a `jest.config.js` file  
```
export default {
  collectCoverage: true,
  coverageDirectory: '<rootDir>/coverage/',
  collectCoverageFrom: [
    'src/**/*.js',
    '!srcexcluded.js',
  ],
  coverageProvider: 'v8',
  coverageReporters: [
    'lcov',
    'text'
  ],
  testMatch: [
    '**/spec/**/*.[sS]pec.js',
  ],
  moduleNameMapper: {
    '^Src(.*)$': '<rootDir>/src/$1'
  }
}
```
