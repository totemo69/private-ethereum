#!/bin/bash

echo "adding peer to bootnode.."
/usr/bin/geth attach /datadisk/private-ethereum/bootnode/data/geth.ipc --exec "admin.addPeer('$1')"
/bin/cat > /datadisk/private-ethereum/bootnode/data/geth/static-nodes.json <<EOF
[
"$1"
]
EOF
echo $1
echo "..done!"

echo "adding bootnode enode to rpcnode.."
bootenode=$(/usr/bin/geth attach /datadisk/private-ethereum/bootnode/data/geth.ipc --exec admin.nodeInfo.enode)
/bin/cat > /datadisk/private-ethereum/rpcnode/data/geth/static-nodes.json <<EOF
[
$bootenode
]
EOF
sed -i s/?discport=0//g /datadisk/private-ethereum/rpcnode/data/geth/static-nodes.json
echo $bootenode
echo "..done!"

echo "adding bootnode enode to minernode.."
bootenode=$(/usr/bin/geth attach /datadisk/private-ethereum/bootnode/data/geth.ipc --exec admin.nodeInfo.enode)
/bin/cat > /datadisk/private-ethereum/minernode/data/geth/static-nodes.json <<EOF
[
$bootenode
]
EOF
sed -i s/?discport=0//g /datadisk/private-ethereum/minernode/data/geth/static-nodes.json
echo $bootenode
echo "..done!"