FROM ubuntu:xenial

MAINTAINER maxime.visonneau@gmail.com

ENV RELEASE xenial
ENV PUPPET_AGENT_VERSION 1.7.0-1${RELEASE}

RUN \
apt-get update && \
apt-get install -y curl locales-all cron && \
curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-${RELEASE}.deb && \
dpkg -i puppetlabs-release-pc1-${RELEASE}.deb && \
rm puppetlabs-release-pc1-${RELEASE}.deb && \
apt-get update && \
apt-get install -y \
puppet-agent=${PUPPET_AGENT_VERSION} && \
rm -rf /var/lib/apt/lists/*

# RUNTIME
ADD docker-entrypoint /docker-entrypoint
ADD docker-entrypoint.d /docker-entrypoint.d
ENTRYPOINT ["/docker-entrypoint"]
