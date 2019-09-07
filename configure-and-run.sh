#!/bin/sh
set -e

echo "configuring forward proxy on port ${PROXY_PORT}"

COMMAND="spdyproxy --port ${PROXY_PORT}"

# generate ssl certificate
echo "enabling ssl support"
mkdir -p /ssl
openssl req -new -x509 -sha256 -nodes -days 1024 -subj "/CN=${PROXY_HOST}" -keyout /ssl/tls.key -out /ssl/tls.crt > /dev/null 2>&1

COMMAND="${COMMAND} --key /ssl/tls.key --cert /ssl/tls.crt"
  
if [ "${BASIC_AUTH}" = "on" ]; then
  echo "enabling basic auth support"
  COMMAND="${COMMAND} --user ${BASIC_USERNAME} --pass ${BASIC_PASSWORD}"
fi

# start nginx
exec ${COMMAND}
