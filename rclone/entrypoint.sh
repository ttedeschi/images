#!/bin/bash

mkdir -p /data/.cache/rclone

/shared-home

rclone mount --cache-dir /data/.cache/rclone \
                    --read-only \
                    --no-check-certificate \
                    --vfs-cache-mode full \
                    --cache-db-purge \
                    --vfs-read-wait 55ms \
                    --vfs-read-ahead 8M \
                    --buffer-size 2M  \
                    --config /config/rclone.conf \
                    shared-home:/home \
                    /shared-home \
                    --use-server-modtime \
                    --log-level DEBUG
