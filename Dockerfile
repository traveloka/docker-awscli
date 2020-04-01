FROM alpine:3.10

ENV AWS_CLI_VERSION=1.17.9
ENV S3_CMD_VERSION=2.0.2
ENV BROTLI_VERSION=1.0.7

RUN apk -v --update --no-cache add \
        python \
        py-pip \
        ca-certificates \
        curl \
        git \
        gzip \
        xz \
        zstd \
        zip \
        tar \ 
        jq \
        # g++ to compile brotli, we can't simply use gcc because it relies on cc1plus
        # https://askubuntu.com/questions/637014/gcc-error-trying-to-exec-cc1plus-execvp-no-such-file-or-directory
        g++ \
        # And also libc-dev because by default alpine doesn't include libc in gcc/g++
        # https://stackoverflow.com/questions/42366739/gcc-cant-find-stdio-h-in-alpine-linux
        libc-dev \
        python2-dev \
    && \
    pip install --upgrade awscli==${AWS_CLI_VERSION} s3cmd==${S3_CMD_VERSION} brotli==${BROTLI_VERSION} && \
    apk -v --purge del py-pip
