#https://hub.docker.com/r/library/node/tags/
FROM node:18.12.0-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache git curl

ARG CMD="npm start"
ARG PORT=8080
ARG NODE_ENV=production
ARG GIT_COMMIT=unspecified
ARG GIT_BRANCH=unspecified
ARG HEALTHCHECK_URL=none

LABEL git_commit=$GIT_COMMIT
LABEL git_branch=$GIT_BRANCH

ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH
ENV NPM_TOKEN=0
ENV PORT $PORT
ENV NODE_ENV $NODE_ENV
ENV GIT_COMMIT $GIT_COMMIT
ENV GIT_BRANCH $GIT_BRANCH
ENV HEALTHCHECK_URL $HEALTHCHECK_URL

RUN mkdir -p $HOME
RUN echo '//registry.npmjs.org/:_authToken=${NPM_TOKEN}' > $HOME/.npmrc

RUN npm i npm@latest -g

COPY ./healthcheck.js /healthcheck.js
HEALTHCHECK --interval=30s CMD node /healthcheck.js

EXPOSE $PORT

WORKDIR $HOME/src

CMD dumb-init $CMD
