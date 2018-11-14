ARG VERSION=unspecified
FROM firstandthird/node:$VERSION

ONBUILD COPY package.json package-lock.* $HOME/src/
ONBUILD RUN npm ci --silent && npm cache clean --force

ONBUILD COPY . $HOME/src
