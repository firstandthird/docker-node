FROM node:6.10-alpine

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

# Sets the HOME environment variable.
ENV HOME=/home/app
ENV PATH=/home/app/src/node_modules/.bin:$PATH

WORKDIR $HOME/src
RUN chown -R node:node $HOME
USER node

COPY package.json $HOME/src
RUN npm install --silent --production

COPY . $HOME/src

CMD ["dumb-init", "npm", "start"]
