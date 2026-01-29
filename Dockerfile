FROM ghcr.io/runatlantis/atlantis:latest

USER root

# Install dependencies
RUN apk add --no-cache \
    aws-cli \
    curl \
    bash

# Install Infracost CLI
RUN curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh

# Ensure correct ownership
RUN chown -R atlantis:atlantis /home/atlantis

# Point Atlantis to self-hosted Infracost API
ENV INFRACOST_API_URL=http://3.26.241.227:4000

USER atlantis

