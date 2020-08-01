FROM rust:1.45.1

WORKDIR /usr/local/app/hello-wasmtime

RUN bash -c "sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs) -y"
RUN curl https://wasmtime.dev/install.sh -sSf | bash
RUN curl https://get.wasmer.io -sSfL | sh

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      less \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

