FROM ghcr.io/runatlantis/atlantis:dev-debian-52cde50

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    jq \
    ca-certificates \
    awscli \
    && rm -rf /var/lib/apt/lists/*

# Ensure correct ownership
RUN chown -R atlantis:atlantis /home/atlantis \
&& mkdir -p /home/atlantis/.aws

COPY config /home/atlantis/.aws/config

USER atlantis

