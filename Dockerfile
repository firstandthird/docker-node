FROM mhart/alpine-node:4.4.4

RUN apk add --update git make python gcc g++

RUN npm i -g nodemon

RUN mkdir -p /app
WORKDIR /app

ONBUILD ADD package.json /app/
ONBUILD RUN npm install --quiet

ONBUILD ADD . /app

CMD ["npm", "start"]
