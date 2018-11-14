ARG VERSION=unspecified
FROM firstandthird/node:$VERSION

RUN npm i nodemon@latest -g

ONBUILD COPY package.json package-lock.* $HOME/src/
ONBUILD RUN npm ci --silent && npm cache clean --force

EXPOSE $PORT 9229 9230

COPY ./start /start

CMD ["dumb-init", "/start"]
