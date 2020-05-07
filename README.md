# BITCOIND container

### Getting started
* Move to your laradock containers directory and download source from repository
```
cd laradock && git clone git@github.com:aayaresko/laradoc-bitcoind-container.git
```

* Update your .env file
```
BITCOIND_RPC_AUTH_STRING=staging:eb9a1b8e0c0b5bcf6161f8a8900c16bc$7a1cbdf6c1c613d45274bbf7f7f816aa33ae5e7660f66f579fe9639b0aa09139
BITCOIND_BLOCKCHAIN_PATH=/var/lib/bitcoind
BITCOIND_RPC_PORT=18332
```

* Build and run the container
```
docker-compose build bitcoind
```

### Usage
You can run the container
```
docker-compose up -d bitcoind
```
