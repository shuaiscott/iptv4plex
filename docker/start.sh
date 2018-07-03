#!/bin/bash

if [ ! -f /app/proxysettings.json ]; then
  echo "{\"port\": $PORT, \"m3u8url\": \"$M3U8URLLIST\", \"tunerlimits\": \"$TUNERLIMITSLIST\", \"xmlurl\": \"$XMLURLLIST\", \"ip\": \"$IPADDRESS\"}" > /app/proxysettings.json
fi

python /app/iptv4plex.py -hl
