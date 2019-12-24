#!/bin/sh

wget http://feed.flightradar24.com/linux/fr24feed_1.0.18-5_amd64.tgz
tar -zxvf fr24feed_1.0.18-5_amd64.tgz
cp -p fr24feed_amd64/fr24feed ../resources/
rm -rf fr24feed_1.0.18-5_amd64.tgz
rm -rf fr24feed_amd64
