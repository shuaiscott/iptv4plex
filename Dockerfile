# Pull base image.
FROM python:3-alpine3.7

COPY . /app/

WORKDIR /app/

ENV m3u8urllist="http://byuhd2-lh.akamaihd.net/i/byutvglobalhd2_live@103134/master.m3u8" \
  tunerlimitslist="1" \
  xmlurllist="" \
  ipaddress="0.0.0.0" \
  port=6969

# Install ffmpeg, required pip packages, and dumb-init
RUN \
  apk add --no-cache bash ffmpeg dumb-init && \
  pip install -r ./requirements.txt && \
  rm -rf /var/lib/apt/lists/* && \
  chmod 777 ./iptv4plex.py && \
  chmod 777 ./docker/start.sh

EXPOSE 6969

CMD ["dumb-init", "./docker/start.sh"]
#CMD [ "python", "/app/iptv4plex.py", "-hl" ]
