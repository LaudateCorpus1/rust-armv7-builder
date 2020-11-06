FROM debian:buster-slim

# Install deps
RUN apt update
RUN apt install -y build-essential wget curl gcc-arm-linux-gnueabihf

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH

RUN rustup target add armv7-unknown-linux-gnueabihf

# Rust config
RUN echo [target.armv7-unknown-linux-gnueabihf] >> /root/.cargo/config
RUN echo linker = \"/usr/bin/arm-linux-gnueabihf-gcc\" >> /root/.cargo/config

