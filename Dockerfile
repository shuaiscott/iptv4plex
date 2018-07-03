# Pull base image.
FROM python:3-alpine3.7

COPY ./iptv4plex.py /app/
COPY ./docker/start.sh /app/
COPY ./requirements.txt /app/

WORKDIR /app/

ENV m3u8urllist="http://byuhd2-lh.akamaihd.net/i/byutvglobalhd2_live@103134/master.m3u8" \
  TUNERLIMITSLIST="1" \
  XMLURLLIST="" \
  IPADDRESS="0.0.0.0" \
  PORT=6969

# Install ffmpeg, required pip packages, and dumb-init
RUN \
  apk add --no-cache bash ffmpeg dumb-init && \
  pip install -r ./requirements.txt && \
  rm -rf /var/lib/apt/lists/* && \
  chmod 777 ./iptv4plex.py && \
  chmod 777 ./start.sh

EXPOSE 6969

CMD ["dumb-init", "./start.sh"]
