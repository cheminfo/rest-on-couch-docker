FROM node:7-slim

# Install pm2
RUN npm install -g pm2

# Get rest-on-couch
WORKDIR /git/rest-on-couch
COPY package.json package.json
RUN npm install

# Set home directory
WORKDIR /rest-on-couch
ENV REST_ON_COUCH_HOME_DIR /rest-on-couch
