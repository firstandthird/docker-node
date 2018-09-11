FROM node:10.10-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache git curl

ARG PORT=8080
ARG NODE_ENV=production
ARG GIT_COMMIT=unspecified
ARG GIT_BRANCH=unspecified

LABEL git_commit=$GIT_COMMIT
LABEL git_branch=$GIT_BRANCH

ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH
ENV NPM_TOKEN=0
ENV NODEMON=1
ENV PORT $PORT
ENV NODE_ENV $NODE_ENV
ENV GIT_COMMIT $GIT_COMMIT
ENV GIT_BRANCH $GIT_BRANCH

RUN mkdir -p $HOME
RUN echo '//registry.npmjs.org/:_authToken=${NPM_TOKEN}' > $HOME/.npmrc

RUN npm i npm@latest nodemon@latest -g

COPY ./healthcheck.js /healthcheck.js
HEALTHCHECK --interval=30s CMD node /healthcheck.js

WORKDIR $HOME/src
RUN chown -R node:node $HOME && chown -R node:node /usr/local

USER node

EXPOSE $PORT 9229 9230

COPY ./start /start

CMD ["dumb-init", "/start"]
