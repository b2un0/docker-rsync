FROM alpine:3

ARG BUILD_DATE
ARG VCS_REF

ENV SCHEDULE "15 3 * * *"

ENV SOURCE ""
ENV TARGET ""

ENV HOST ""
ENV PORT ""
ENV LOGIN ""

ENV RSYNC_OPTIONS ""
ENV SSH_OPTIONS ""

RUN apk --no-cache add openssh rsync

RUN echo "${SCHEDULE} /usr/local/bin/file-sync" > /etc/crontabs/root

ADD file-sync /usr/local/bin/

CMD ["/usr/sbin/crond", "-l", "2", "-f"]

LABEL org.opencontainers.image.created=${BUILD_DATE} \
      org.opencontainers.image.revision=${VCS_REF} \
      org.opencontainers.image.source="https://github.com/b2un0/docker-rsync"
