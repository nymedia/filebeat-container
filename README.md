# Custom Filebeat Image for CloudWatch Logs

This repository contains a Dockerfile for building a custom Filebeat image with the AWS CloudWatch input plugin pre-configured.

## Configuration

The custom Filebeat image is based on the official Filebeat image from Elastic, with the following modifications:

The AWS CloudWatch input plugin is pre-configured in an additional input configuration file (`aws-cloudwatch-input.yml`).
The Elasticsearch output configurations are parameterized using environment variables in the `filebeat.yml` configuration file.
The base image tag can be specified using the `FILEBEAT_VERSION` build argument.

The following environment variables can be used to configure the Filebeat container at runtime:

- `LOG_GROUP_ARN`: The ARN of the CloudWatch log group that Filebeat should read logs from.
- `ELASTICSEARCH_HOST`: The Elasticsearch endpoint to which Filebeat should send the logs (including the port number).
- `ELASTICSEARCH_PROTO`: The protocol used to communicate withb Elasticsearch, usually http or https (default).
- `ELASTICSEARCH_USERNAME`: The username for authenticating with the Elasticsearch endpoint.
- `ELASTICSEARCH_PASSWORD`: The password for authenticating with the Elasticsearch endpoint.

### Building the Image

To build the custom Filebeat image, run the following command:

```sh
docker build -t my-filebeat:latest --build-arg FILEBEAT_VERSION=7.17.8 .
