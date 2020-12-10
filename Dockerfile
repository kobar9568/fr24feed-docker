FROM ubuntu:latest

MAINTAINER kobar9568

# Include necessary files.
COPY resources/dump1090-mutability_1.15~dev_amd64.deb /tmp/dump1090-mutability_1.15~dev_amd64.deb
COPY resources/fr24feed /usr/bin/fr24feed
COPY resources/fr24feed.ini /etc/fr24feed.ini

# Install deb package and various prepare.
RUN apt-get update && \
    apt-get install -y --no-install-recommends /tmp/dump1090-mutability_1.15~dev_amd64.deb && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/dump1090-mutability_1.15~dev_amd64.deb && \
    mkdir /usr/lib/fr24/ && \
    ln -s /usr/bin/dump1090-mutability /usr/lib/fr24/dump1090 && \
    mkdir /var/log/fr24feed/

# Expose Ports. 8754:WebUI 300002:RAW Data 30003:Basestation
EXPOSE 8754
EXPOSE 30002
EXPOSE 30003

ENTRYPOINT fr24feed
