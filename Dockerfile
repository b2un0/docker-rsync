FROM alpine:3

ENV SCHEDULE="15 3 * * *" \
    CRON_CMD="/usr/local/bin/file-sync"\
    SOURCE="" \
    TARGET="" \
    HOST="" \
    PORT="" \
    LOGIN="" \
    RSYNC_OPTIONS="" \
    SSH_OPTIONS=""

RUN apk --no-cache add openssh rsync

ADD file-sync /usr/local/bin/

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/crond", "-f"]

SHELL ["/bin/ash"]
