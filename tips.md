## Remote debugging of phone web pages
https://docs.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/remote-debugging/

## eslint
https://eslint.org/  
`/* eslint-disable-line no-labels  */`  
`/* global page */`  

## git
Excluding a file from a git diff `git diff ':!**excludeme.js'`  
Reverting a commit `git reset <commit_hash>` or harsher `git revert <commit_hash>`  

Setting up meld
```
git config --global merge.tool meld
git config --global mergetool.meld.path "C:\Users\duncan\AppData\Local\Programs\Meld\Meld.exe"
```

Interactively merging a stash back into the branch
```git difftool -d stash@{0}```
* note - only really works with a just made stash

## vscode
using **jsconfig** : https://code.visualstudio.com/docs/languages/jsconfig  https://www.typescriptlang.org/tsconfig  
using **editorconfig** : https://editorconfig.org/  

it is possible to prevent vscode complaining about unused variables/imports if they are private (i.e. prefixed with _ ),  
e.g. `import { thing as _mocked } from 'module'`

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
puppeteer:  https://pptr.dev/     

### setup
**@babel/preset-env** : https://babeljs.io/docs/en/babel-preset-env  
**puppeteer** : https://github.com/smooth-code/jest-puppeteer/tree/master and https://github.com/puppeteer/puppeteer  
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

## Bash
last return value `echo $?`  

## Interesting Reads    
https://medium.com/@justintulk  
https://medium.com/@justintulk/solve-module-import-aliasing-for-webpack-jest-and-vscode-74007ce4adc9  

## Handy posts
https://stackoverflow.com/questions/9847580/how-to-detect-safari-chrome-ie-firefox-and-opera-browser  
https://css-tricks.com/a-complete-guide-to-custom-properties/
