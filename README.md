## DOTFILES

      npm i --save-dev eslint eslint-config-airbnb eslint-config-airbnb-base eslint-config-prettier eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react husky lint-staged

### package.json
----
    "scripts": {
    "build-css": "node-sass-chokidar src/ -o src/",
    "watch-css": "npm run build-css && node-sass-chokidar src/ -o src/ --watch --recursive",
    "test": "echo \"Error: no test specified\" && exit 1",
    "start-js": "react-scripts start",
    "start": "npm-run-all -p watch-css start-js",
    "build-js": "react-scripts build",
    "build": "npm-run-all build-css build-js",
    "precommit": "lint-staged",
    "lint": "eslint --fix 'src/**/*.js'"
    },
    "lint-staged": {
    "*.{css}": [
      "prettier --write",
      "git add"
    ],
    "*.{js}": [
      "eslint --fix 'src/**/*.js'",
      "git add"
    ]
    },