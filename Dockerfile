FROM ubuntu:latest
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  bind9
RUN rm -rf /etc/bind/*
EXPOSE 53 953
RUN mkdir -p /var/run/named && chown bind:bind /var/run/named
ENTRYPOINT chown -R bind:bind /etc/bind/ && /usr/sbin/named -g -c /etc/bind/named.conf -u bind
