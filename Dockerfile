FROM alpine:3.3

MAINTAINER Andy VanEe

RUN apk add --update bash curl && rm -rf /var/cache/apk/*

ADD build_config.rb /tmp/build_config.rb
ADD install.sh /tmp/install.sh

RUN /tmp/install.sh

CMD /bin/bash
