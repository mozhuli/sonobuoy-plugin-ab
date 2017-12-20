FROM alpine:3.6

MAINTAINER mozhuli

ENV TERM linux
RUN apk --no-cache add bash apache2-utils

COPY run_ab.sh /run_ab.sh

CMD ["/bin/bash", "-c", "/run_ab.sh"]