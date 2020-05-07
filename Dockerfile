FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget

RUN wget -O /tmp/bitcoin-core.zip https://bitcoin.org/bin/bitcoin-core-0.19.1/bitcoin-0.19.1-x86_64-linux-gnu.tar.gz
RUN tar zxpf /tmp/bitcoin-core.zip -C /tmp
RUN cp /tmp/bitcoin-0.19.1/bin/bitcoind /usr/local/bin && \
    cp /tmp/bitcoin-0.19.1/bin/bitcoin-cli /usr/local/bin

ARG BITCOIND_CONFIG_PATH=/home/root/bitcoin.conf
ARG BITCOIND_BLOCKCHAIN_PATH
ARG BITCOIND_RPC_AUTH_STRING
ARG BITCOIND_RPC_PORT

ENV BITCOIND_BLOCKCHAIN_PATH ${BITCOIND_BLOCKCHAIN_PATH}
ENV BITCOIND_CONFIG_PATH ${BITCOIND_CONFIG_PATH}

RUN mkdir -p $BITCOIND_BLOCKCHAIN_PATH

COPY bitcoin.conf $BITCOIND_CONFIG_PATH

RUN sed -i "s/rpcauth=/rpcauth=${BITCOIND_RPC_AUTH_STRING}/g" $BITCOIND_CONFIG_PATH
RUN sed -i "s#datadir=#datadir=${BITCOIND_BLOCKCHAIN_PATH}#g" $BITCOIND_CONFIG_PATH

RUN rm -rf /tmp/*

CMD bitcoind -conf=${BITCOIND_CONFIG_PATH}

EXPOSE $BITCOIND_RPC_PORT
