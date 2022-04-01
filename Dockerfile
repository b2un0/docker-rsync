FROM alpine:3

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

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

CMD ["/usr/sbin/crond", "-l", "2", "-f"]

SHELL ["/bin/ash"]

LABEL org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.version=${VERSION} \
      org.opencontainers.image.source="https://github.com/b2un0/docker-rsync"
