FROM mhart/alpine-node:4.4.4

RUN npm i -g nodemon

RUN mkdir -p /app
WORKDIR /app

ONBUILD COPY package.json /app/
ONBUILD RUN npm install --silent

ONBUILD ADD . /app

CMD ["npm", "start"]
