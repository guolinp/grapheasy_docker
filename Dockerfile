FROM alpine:3.8

ENV BUILD_DEPENDENCIES="build-base"

RUN apk add --update --no-cache \
        ${BUILD_DEPENDENCIES} \
        apkbuild-cpan \
        perl-dev && \
        yes '' | cpan -i Graph::Easy && \
        apk del --purge \
        ${BUILD_DEPENDENCIES}

CMD ["/bin/sh", "-c"]
