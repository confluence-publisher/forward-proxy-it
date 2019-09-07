FROM node:0.10-slim

RUN npm install -g spdyproxy

ENV PROXY_HOST=localhost
ENV PROXY_PORT=443
ENV BASIC_AUTH=off
ENV BASIC_USERNAME=
ENV BASIC_PASSWORD=

EXPOSE ${PROXY_PORT}

ADD configure-and-run.sh /

ENTRYPOINT ["/configure-and-run.sh"]
