FROM node:8.1-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache --virtual git

# Sets the HOME environment variable.
ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH

WORKDIR $HOME/src

ONBUILD COPY package.json npm-shrinkwrap.* $HOME/src
ONBUILD RUN npm install --silent --production

ONBUILD COPY . $HOME/src
ONBUILD RUN chown -R node:node $HOME
ONBUILD USER node

CMD ["dumb-init", "npm", "start"]
