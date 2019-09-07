# Docker Image for Proxy-based Tests

This Docker image provides a configurable HTTPS forward proxy with optional support for basic authentication useful for
testing publishing documentation to Confluence via a forward proxy, e.g. as part of integration tests based on test
containers.


## Configuration Options

The following configuration options are available via environment variables:

Name | Description | Required
---- | ----------- | -------
PROXY_HOST     | Host name of the proxy to listen on | yes
PROXY_PORT     | Port of the proxy to listen on (HTTPS) | yes
BASIC_AUTH     | Whether to enable (`on`, default) or disable (`off`) basic authentication on the proxy | yes
BASIC_USERNAME | Username configured for basic authentication | if basic authentication has been enabled
BASIC_PASSWORD | Password configured for basic authentication | if basic authentication has been enabled


## Build Forward Proxy Integration Test Image
Run the following command to build and push the image:

`docker build -t confluencepublisher/forward-proxy-it:<version> .`

`docker push confluencepublisher/forward-proxy-it:<version>` (requires access to DockerHub for confluencepublisher)


## Run Forward Proxy Integration Test Image
Run the following command to start the container (with basic authentication enabled, running on port 8443):

`docker run --rm -d -p8443:8443
  -e PROXY_HOST=proxy.host
  -e PROXY_PORT=8443
  -e BASIC_AUTH=on
  -e BASIC_USERNAME=proxy-user
  -e BASIC_PASSWORD=proxy1234
  confluencepublisher/forward-proxy-it:<version>`
