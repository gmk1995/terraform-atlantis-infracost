FROM ghcr.io/runatlantis/atlantis:latest

USER root

# Install dependencies
RUN apk add --no-cache \
    aws-cli \
    curl \
    bash


# Ensure correct ownership
RUN chown -R atlantis:atlantis /home/atlantis \
&& mkdir -p /home/atlantis/.aws

COPY config /home/atlantis/.aws/config

USER atlantis

