FROM mhart/alpine-node:4.4.4

RUN apk add --update git make python gcc g++

RUN npm i -g nodemon bower grunt-cli

RUN mkdir -p /app
WORKDIR /app

RUN npm install node-sass --silent
ONBUILD ADD package.json /app/
ONBUILD RUN npm install --quiet

ONBUILD ADD bower.json /app/bower.json
ONBUILD RUN bower install --allow-root

ONBUILD ADD . /app

CMD ["npm", "start"]
