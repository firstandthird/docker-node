FROM mhart/alpine-node:4.4.4

RUN apk add --update git make python gcc g++

VOLUME /root/.npm

RUN mkdir -p /app/server
WORKDIR /app/server
ENV PATH /app/node_modules/.bin:$PATH

ONBUILD COPY package.json /app/
ONBUILD RUN cd /app && npm install

ONBUILD ADD . /app/server

CMD ["npm", "start"]
