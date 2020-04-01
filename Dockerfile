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
    && \
    pip install --upgrade awscli==${AWS_CLI_VERSION} s3cmd==${S3_CMD_VERSION} brotli==${BROTLI_VERSION} && \
    apk -v --purge del py-pip
