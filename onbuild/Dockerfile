FROM node:6.10-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache --virtual git

# Sets the HOME environment variable.
ENV HOME=/home/app

WORKDIR $HOME/src

ONBUILD COPY package.json $HOME/src
ONBUILD RUN npm install --silent --production

ONBUILD COPY . $HOME/src
ONBUILD RUN chown -R node:node $HOME
ONBUILD USER node

CMD ["dumb-init", "npm", "start"]
