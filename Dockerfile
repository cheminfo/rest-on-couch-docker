FROM node:7-alpine

ENV ROC_VERSION 4.0.2

RUN apk add --no-cache curl && \
    curl -fSL https://github.com/cheminfo/rest-on-couch/archive/v$ROC_VERSION.tar.gz -o $ROC_VERSION.tar.gz && \
    tar -xzf $ROC_VERSION.tar.gz && \
    mv rest-on-couch-${ROC_VERSION} rest-on-couch-source && \
    yarn global add pm2 && \
    cd /rest-on-couch-source && \
    yarn && \
    rm -rf /root/.npm /usr/local/share/.cache /root/.cache /${ROC_VERSION}.tar.gz /rest-on-couch-source/test

ENV NODE_ENV production
ENV REST_ON_COUCH_HOME_DIR /rest-on-couch

WORKDIR /rest-on-couch-source
CMD ["yarn", "run", "start:prod"]
