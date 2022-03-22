FROM alpine:3

ARG BUILD_DATE
ARG VCS_REF

ENV SCHEDULE="15 3 * * *" \
    SOURCE="" \
    TARGET="" \
    HOST="" \
    PORT="" \
    LOGIN="" \
    RSYNC_OPTIONS="" \
    SSH_OPTIONS=""

RUN apk --no-cache add openssh rsync

RUN echo "${SCHEDULE} /usr/local/bin/file-sync" > /etc/crontabs/root

ADD file-sync /usr/local/bin/

CMD ["/usr/sbin/crond", "-l", "2", "-f"]

SHELL ["/bin/ash"]

LABEL org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.source="https://github.com/b2un0/docker-rsync"
