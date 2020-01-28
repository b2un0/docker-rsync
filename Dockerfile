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

RUN apk --no-cache add curl openssh rsync

RUN echo "${SCHEDULE} /usr/local/bin/file-sync" > /etc/crontabs/root

ADD file-sync /usr/local/bin/

CMD ["/usr/sbin/crond", "-l", "2", "-f"]

LABEL org.label-schema.name="Docker rsync" \
      org.label-schema.vcs-ref=${VCS_REF} \
      org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.vcs-url="https://github.com/b2un0/docker-rsync" \
      org.label-schema.schema-version="1.0"