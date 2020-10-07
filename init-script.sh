#!/bin/sh
if [ ! -d /root/private-ethereum/geth/chaindata ]; then
    echo "/root/private-ethereum/geth/chaindata, running 'geth init'..."
    geth init --datadir /root/private-ethereum /root/genesis.json >> /root/private-ethereum/eth.log
    echo "...done!"
fi
geth "$@"