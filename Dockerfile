FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y cron && \
    apt-get install -y vim && \
    apt-get clean

COPY crontab /etc/cron.d/mycrontab
COPY entrypoint.sh /tmp/entrypoint.sh

RUN chmod 0644 /etc/cron.d/mycrontab && \
    crontab /etc/cron.d/mycrontab && \
    chmod +x /tmp/entrypoint.sh

ENTRYPOINT /tmp/entrypoint.sh
