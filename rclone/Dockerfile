FROM ubuntu:21.04

RUN apt update && apt-get install -y wget

RUN wget https://downloads.rclone.org/v1.58.1/rclone-v1.58.1-linux-amd64.deb

RUN dpkg -i rclone-v1.58.1-linux-amd64.deb

RUN mkdir -p /config

COPY rclone.conf /config/rclone.conf

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x 

ENTRYPOINT /entrypoint.sh