FROM mhart/alpine-node:6.7

RUN apk add --update git make python gcc g++

RUN mkdir -p /app
WORKDIR /app

ONBUILD COPY package.json /app
ONBUILD RUN npm install --silent --production

ONBUILD COPY . /app

CMD ["npm", "start"]
