# Pull base image.
FROM python:3-alpine

COPY . /usr/src/app/

WORKDIR /usr/src/app/

ENV m3u8-url-list "http://byuhd2-lh.akamaihd.net/i/byutvglobalhd2_live@103134/master.m3u8"
ENV tuner-limits-list "1"
ENV xml-url-list
ENV ipaddress
ENV port

# Install ffmpeg and required pip packages
RUN \
  apk add --no-cache ffmpeg && \
  pip install -r ./requirements.txt && \
  rm -rf /var/lib/apt/lists/* && \
  chmod 777 ./iptv4plex.py && \
  echo '{"port": ${port:-6969}, "m3u8url": "${m3u8-url-list}", "tunerlimits": "${tuner-limits-list}", "xmlurl": "${xml-url-list}", "ip": "${ipaddress:-127.0.0.1}"}' > ./proxysettings.json
  
EXPOSE 6969

CMD [ "./iptv4plex.py -hl" ]
