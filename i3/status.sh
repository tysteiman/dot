#!/bin/bash

# apparently we can return things like [{"": "", "full_text": "VOL 100", "name": "volume", "instance": "Master", "separator_block_width": 15, "short_text": x, "color": "#foo"}]
# ifconfig wlo1 | grep -v inet6 | grep inet | awk '{print }'

while :;
do
    _date=$(date +" %m-%d-%y   %H:%M")
    _disk=$(df -h | grep "/dev/nvme0n1p6" | awk '{print $5}')

    printf "%s  %s" $_disk $_date
    echo -n

    sleep 30s
done
