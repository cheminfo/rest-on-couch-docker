FROM node:10 as builder

ENV ROC_VERSION 5.8.0

RUN curl -fSL https://github.com/cheminfo/rest-on-couch/archive/v$ROC_VERSION.tar.gz -o $ROC_VERSION.tar.gz && \
    tar -xzf $ROC_VERSION.tar.gz && \
    mv rest-on-couch-${ROC_VERSION} rest-on-couch-source && \
    cd /rest-on-couch-source && \
    npm ci && \
    npm run build && \
    rm -rf node_modules

FROM node:10

ENV NODE_ENV production
ENV REST_ON_COUCH_HOME_DIR /rest-on-couch

COPY --from=builder /rest-on-couch-source /rest-on-couch-source

RUN npm install -g pm2 && \
    cd /rest-on-couch-source && \
    npm ci && \
    rm -rf /root/.npm /rest-on-couch-source/test

WORKDIR /rest-on-couch-source
CMD ["node", "bin/rest-on-couch-server.js"]
