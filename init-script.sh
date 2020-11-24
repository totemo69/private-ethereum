#!/bin/bash
if [ ! -d /datadisk/private-ethereum/bootnode/data/geth/chaindata ]; then
    echo "/datadisk/private-ethereum/bootnode/geth/chaindata, running 'geth init'..."
    /usr/bin/geth init --datadir /datadisk/private-ethereum/bootnode/data /datadisk/private-ethereum/genesis.json
    echo "...done!"
else
    echo "geth init unsuccessful on bootnode, please check logs.."
fi    
if [ ! -d /datadisk/private-ethereum/rpcnode/data/geth/chaindata ]; then
    echo "/datadisk/private-ethereum/rpcnode/geth/chaindata, running 'geth init'..."
    /usr/bin/geth init --datadir /datadisk/private-ethereum/rpcnode/data /datadisk/private-ethereum/genesis.json
    echo "...done!"
else
    echo "geth init unsuccessful on rpcnode, please check logs.."
fi    
if [ ! -d /datadisk/private-ethereum/minernode/data/geth/chaindata ]; then
    echo "/datadisk/private-ethereum/minernode/geth/chaindata, running 'geth init'..."
    /usr/bin/geth init --datadir /datadisk/private-ethereum/minernode/data /datadisk/private-ethereum/genesis.json
    echo "...done!"
else
    echo "geth init unsuccessful on minernode, please check logs.."
fi