#!/bin/bash
if [ ! -L /lib/systemd/system/bootnode.service ]; then
        echo "linking systemd bootnode.service..."
        /bin/ln -s /datadisk/private-ethereum/bootnode/bootnode.service /lib/systemd/system
        echo "...done!"
else
        echo "bootnode.service already exist.."
fi
if [ ! -L /lib/systemd/system/rpcnode.service ]; then
        echo "linking systemd rpcnode.service..."
        /bin/ln -s /datadisk/private-ethereum/rpcnode/rpcnode.service /lib/systemd/system
        echo "...done!"
else
        echo "rpcnode.service already exist.."
fi
if [ ! -L /lib/systemd/system/minernode.service ]; then
        echo "linking systemd minernode.service..."
        /bin/ln -s /datadisk/private-ethereum/minernode/minernode.service /lib/systemd/system
        echo "...done!"
else
        echo "minernode.service already exist.."
fi