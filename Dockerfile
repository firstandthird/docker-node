FROM mhart/alpine-node:4.4.4

RUN apk add --update git make python gcc g++

RUN npm i -g nodemon bower grunt-cli

RUN mkdir -p /app
WORKDIR /app

RUN npm install node-sass --quiet

RUN npm install \
  babel-code-frame@^6.6.5 \
  babel-helper-builder-binary-assignment-operator-visitor@^6.6.5 \
  babel-helper-call-delegate@^6.6.5 \
  babel-helper-define-map@^6.6.5 \
  babel-helper-function-name@^6.6.0 \
  babel-helper-get-function-arity@^6.6.5 \
  babel-helper-regex@^6.6.5 \
  babel-helper-replace-supers@^6.6.5 \
  babel-messages@^6.6.5 \
  babel-preset-es2015@6.9.0 \
  babel-template@^6.6.5 \
  babel-traverse@^6.6.5 \
  babel-types@^6.6.5 \
  babelify-es6-polyfill@^1.0.4 --quiet

ONBUILD COPY package.json /app/
ONBUILD RUN npm install --quiet

ONBUILD ADD bower.json /app/bower.json
ONBUILD RUN bower install --allow-root

ONBUILD ADD . /app

CMD ["npm", "start"]
