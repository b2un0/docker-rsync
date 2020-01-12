FROM alpine:3

ENV SCHEDULE "15 3 * * *"

ENV SOURCE ""
ENV TARGET ""

ENV HOST ""
ENV PORT ""
ENV LOGIN ""

ENV RSYNC_OPTIONS ""
ENV SSH_OPTIONS ""

RUN apk add bash curl openssh rsync

RUN echo "${SCHEDULE} /usr/local/bin/media-sync" > /etc/crontabs/root

ADD media-sync /usr/local/bin/

CMD ["/usr/sbin/crond", "-l", "2", "-f"]