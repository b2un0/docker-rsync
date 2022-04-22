#!/bin/ash -e

echo "startup $0"

if [ ! -z "${SCHEDULE}" ] &&  [ ! -z "${CRON_CMD}" ]; then
  echo "configure cron: ${SCHEDULE} ${CRON_CMD}"
  echo "${SCHEDULE} ${CRON_CMD}" > /var/spool/cron/crontabs/root
fi

echo "run: $@"
exec "$@"
