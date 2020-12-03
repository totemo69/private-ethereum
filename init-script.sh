#!/bin/bash
if [ ! -d /datadisk/private-ethereum/bootnode/data/geth/chaindata ]; then
    echo "/datadisk/private-ethereum/bootnode/geth/chaindata, running 'geth init'..."
    /usr/bin/geth init --datadir /datadisk/private-ethereum/bootnode/data /datadisk/private-ethereum/genesis.json
    echo "...done!"
    echo "copying UTC file for bootnode..."
    /bin/cp -f /datadisk/private-ethereum/bootnode/keystore/* /datadisk/private-ethereum/bootnode/data/keystore/
    echo "...done!"
else
    echo "geth init unsuccessful or already exist on bootnode, please check logs.."
fi    
if [ ! -d /datadisk/private-ethereum/rpcnode/data/geth/chaindata ]; then
    echo "/datadisk/private-ethereum/rpcnode/geth/chaindata, running 'geth init'..."
    /usr/bin/geth init --datadir /datadisk/private-ethereum/rpcnode/data /datadisk/private-ethereum/genesis.json
    echo "...done!"
    echo "copying UTC file for rpcnode..."
    /bin/cp -f /datadisk/private-ethereum/rpcnode/keystore/* /datadisk/private-ethereum/rpcnode/data/keystore/
    echo "...done!"
else
    echo "geth init unsuccessful or already exist on rpcnode, please check logs.."
fi    
if [ ! -d /datadisk/private-ethereum/minernode/data/geth/chaindata ]; then
    echo "/datadisk/private-ethereum/minernode/geth/chaindata, running 'geth init'..."
    /usr/bin/geth init --datadir /datadisk/private-ethereum/minernode/data /datadisk/private-ethereum/genesis.json
    echo "...done!"
    echo "copying UTC file for minernode..."
    /bin/cp -f /datadisk/private-ethereum/minernode/keystore/* /datadisk/private-ethereum/minernode/data/keystore/
    echo "...done!"
else
    echo "geth init unsuccessful or already exist on minernode, please check logs.."
fi