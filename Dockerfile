ARG FILEBEAT_VERSION=7.17.8
FROM docker.elastic.co/beats/filebeat:${FILEBEAT_VERSION}

ARG ARCH=amd64
ARG YTT_VERSION=0.43.3

# Install the ytt templating tool
USER root
COPY docker-entrypoint-wrapper /docker-entrypoint-wrapper

RUN set -e ; \
  chmod +x /docker-entrypoint-wrapper ; \
  chown filebeat /usr/share/filebeat/filebeat.yml ; \
  curl -L -o /usr/local/bin/ytt https://github.com/carvel-dev/ytt/releases/download/v${YTT_VERSION}/ytt-linux-${ARCH} ; \
  chmod +x /usr/local/bin/ytt

USER filebeat
# Copy the custom configuration files into the container
COPY --chown=filebeat:filebeat templates/* /usr/share/filebeat/templates/

ENTRYPOINT [ "/docker-entrypoint-wrapper" ]
