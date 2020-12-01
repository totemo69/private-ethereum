#!/bin/bash

echo "adding peer to bootnode.."
/usr/bin/geth attach /datadisk/private-ethereum/bootnode/data/geth.ipc --exec "admin.addPeer('$1')"
echo "..creating static-nodes.json.."
/bin/cat > /datadisk/private-ethereum/bootnode/data/geth/static-nodes.json <<EOF
[
"$1"
]
EOF
/bin/cat /datadisk/private-ethereum/bootnode/data/geth/static-nodes.json
echo "..done!"

echo "adding bootnode enode to rpcnode peer.."
bootenode=$(/usr/bin/geth attach /datadisk/private-ethereum/bootnode/data/geth.ipc --exec admin.nodeInfo.enode)
echo "..creating static-nodes.json.."
/bin/cat > /datadisk/private-ethereum/rpcnode/data/geth/static-nodes.json <<EOF
[
$bootenode
]
EOF
/bin/sed -i s/?discport=0//g /datadisk/private-ethereum/rpcnode/data/geth/static-nodes.json
/bin/cat /datadisk/private-ethereum/rpcnode/data/geth/static-nodes.json
echo "..done!"

echo "adding bootnode enode to minernode peer.."
bootenode=$(/usr/bin/geth attach /datadisk/private-ethereum/bootnode/data/geth.ipc --exec admin.nodeInfo.enode)
echo "..creating static-nodes.json.."
/bin/cat > /datadisk/private-ethereum/minernode/data/geth/static-nodes.json <<EOF
[
$bootenode
]
EOF
/bin/sed -i s/?discport=0//g /datadisk/private-ethereum/minernode/data/geth/static-nodes.json
/bin/cat /datadisk/private-ethereum/minernode/data/geth/static-nodes.json
echo "..done!"