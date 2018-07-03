#!/bin/bash

if [ ! -f /app/proxysettings.json ]; then
  echo "{\"port\": \"$port\", \"m3u8url\": \"$m3u8urllist\", \"tunerlimits\": \"$tunerlimitslist\", \"xmlurl\": \"$xmlurllist\", \"ip\": \"$ipaddress\"}" > /app/proxysettings.json
fi

python /app/iptv4plex.py -hl


