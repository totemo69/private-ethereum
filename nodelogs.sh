#!/bin/bash

echo "creating logrotate config.."
/bin/cat > /etc/logrotate.d/node-logs <<EOF
/datadisk/private-ethereum/logs/*.log {
        daily
        create 644 $1 $1
        missingok
        rotate 30
        compress
        copytruncate
        delaycompress
        dateext
}
EOF
echo "...done!"