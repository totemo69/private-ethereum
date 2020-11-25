#!/bin/bash

echo "linking systemd bootnode.service..."
/bin/cp -f /datadisk/private-ethereum/bootnode/bootnode.service /etc/systemd/system
/bin/sed -i 's/uservm2/'$1'/g' /etc/systemd/system/bootnode.service
echo "...done!"

echo "linking systemd rpcnode.service..."
/bin/cp -f /datadisk/private-ethereum/rpcnode/rpcnode.service /etc/systemd/system
/bin/sed -i 's/uservm2/'$1'/g' /etc/systemd/system/rpcnode.service
/bin/sed -i 's/psvm1.japaneast.cloudapp.azure.com/'$2'/g' /etc/systemd/system/rpcnode.service
echo "...done!"
        
echo "linking systemd minernode.service..."
/bin/cp -f /datadisk/private-ethereum/minernode/minernode.service /etc/systemd/system
/bin/sed -i 's/uservm2/'$1'/g' /etc/systemd/system/minernode.service
echo "...done!"

echo "executing daemon reload.."
sudo systemctl daemon-reload
echo "...done!"

echo "enabling at startup.."
sudo systemctl enable bootnode.service
sudo systemctl enable rpcnode.service
sudo systemctl enable minernode.service
echo "...done!"