FROM node:8.9-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache git curl

RUN yarn global add npm

# Sets the HOME environment variable.
ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH
ENV NPM_TOKEN=0

RUN mkdir -p $HOME
RUN echo '//registry.npmjs.org/:_authToken=${NPM_TOKEN}' > $HOME/.npmrc

WORKDIR $HOME/src

ONBUILD COPY package.json package-lock.* $HOME/src/
ONBUILD RUN npm install --silent --production && npm cache clean --force

ONBUILD COPY . $HOME/src

CMD ["dumb-init", "npm", "start"]
