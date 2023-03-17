ARG FILEBEAT_VERSION=7.17.8
FROM docker.elastic.co/beats/filebeat:${FILEBEAT_VERSION}

# Copy the custom configuration files into the container
COPY --chown=filebeat:filebeat templates/filebeat.yml /usr/share/filebeat/filebeat.yml
COPY --chown=filebeat:filebeat templates/aws-cloudwatch-input.yml /usr/share/filebeat/aws-cloudwatch-input.yml
