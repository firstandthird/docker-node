FROM mhart/alpine-node:4.4.4

RUN npm i -g nodemon bower grunt-cli

RUN mkdir -p /app
WORKDIR /app

ONBUILD COPY package.json /app/
ONBUILD RUN npm install --silent

ONBUILD ADD bower.json /app/bower.json
ONBUILD RUN bower install --allow-root

ONBUILD ADD . /app

CMD ["npm", "start"]
