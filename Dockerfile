FROM alpine

ENV GHC_VERSION=8.6.5
ENV GHC_INSTALL_PATH=/opt/ghc

RUN wget https://github.com/redneb/ghc-alt-libc/releases/download/ghc-${GHC_VERSION}-musl/ghc-${GHC_VERSION}-x86_64-unknown-linux-musl.tar.xz && \
    tar xf ghc-${GHC_VERSION}-x86_64-unknown-linux-musl.tar.xz


RUN apk update && \
    apk add bash perl alpine-sdk

WORKDIR ghc-${GHC_VERSION}

RUN ./configure --prefix=${GHC_INSTALL_PATH} && \
    make install && \
    ${GHC_INSTALL_PATH}/bin/ghc --help
