#!/bin/sh

docker run \
--name fr24feed \
--restart=always \
--detach \
-p 8754:8754 \
-p 30002:30002 \
-p 30003:30003 \
--device=/dev/bus/usb \
-it kobar9568/fr24feed:latest
