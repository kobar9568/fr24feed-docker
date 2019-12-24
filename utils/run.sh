#!/bin/sh

TAG="1.0"
DONGLE_BUS="001/007"

docker run --name fr24feed -d -p 8754:8754 -p 30002:30002 -p 30003:30003 --device=/dev/bus/usb/${DONGLE_BUS} -it fr24feed:${TAG}
