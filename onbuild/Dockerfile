FROM node:8.8-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache git curl

RUN yarn global add npm

# Sets the HOME environment variable.
ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH

WORKDIR $HOME/src

ONBUILD COPY package.json package-lock.* $HOME/src/
ONBUILD RUN npm install --silent --production && npm cache clean --force

ONBUILD COPY . $HOME/src

CMD ["dumb-init", "npm", "start"]
