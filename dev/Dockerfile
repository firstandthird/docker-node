ARG VERSION=unspecified
FROM firstandthird/node:$VERSION

RUN npm i nodemon@latest -g
ENV NODEMON=1

ONBUILD COPY package.json package-lock.* $HOME/src/
ONBUILD RUN npm ci --loglevel error && npm cache clean --force

EXPOSE $PORT 9229 9230

COPY ./start /start

CMD ["dumb-init", "/start"]
