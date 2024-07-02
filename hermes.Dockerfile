FROM rust:1.78 as builder
WORKDIR /usr/src/hermes
RUN cargo install ibc-relayer-cli --bin hermes --locked
FROM debian:12.5-slim
RUN apt update && apt install -y libssl-dev pkg-config libclang-dev cmake
WORKDIR /root/
COPY --from=builder /usr/local/cargo/bin/hermes /usr/local/bin/hermes
CMD ["hermes", "start"]