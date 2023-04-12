# Custom Filebeat Image for CloudWatch Logs

This repository contains a Dockerfile for building a custom Filebeat image with the AWS CloudWatch input plugin and uses `ytt` templates for generating the configuration file.

## Configuration

The custom Filebeat image is based on the official Filebeat image from Elastic, with the following modifications:

- The AWS CloudWatch input plugin is pre-configured using a ytt template (`filebeat.config.yml`).
- The Elasticsearch output configurations are parameterized using environment variables in the ytt template.
- The base image tag can be specified using the `FILEBEAT_VERSION` build argument.

### Generating the Filebeat Configuration

To generate the `filebeat.yml` configuration file using ytt, the `docker-entrypoint-wrapper` script will be executed at container startup. The wrapper script makes use of the ytt templates `filebeat.config.yml` and `filebeat.ytt-schema.yml` along with the environment variables prefixed with `FILEBEAT_`.

Make sure to set the required environment variables when running the container. For example:

```sh
docker run -e FILEBEAT_cloudwatch_log_group_arn=your_log_group_arn \
           -e FILEBEAT_elasticsearch__hosts="your_elasticsearch_host:9200" \
           -e FILEBEAT_elasticsearch__username=your_username \
           -e FILEBEAT_elasticsearch__password=your_password \
           your_custom_filebeat_image
```
