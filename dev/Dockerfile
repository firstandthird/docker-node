FROM node:8.1-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

RUN apk add --update --no-cache --virtual git

# Sets the HOME environment variable.
ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH

WORKDIR $HOME/src
RUN chown -R node:node $HOME && chown -R node:node /usr/local

USER node

RUN npm i -g nodemon

CMD ["dumb-init", "nodemon", "-x", "npm", "start"]
