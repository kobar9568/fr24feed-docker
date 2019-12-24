# fr24feed-docker

fr24feedをDockerコンテナで動かすやつ

## Description

* コンテナを上げるだけでFlightradar24にfeedする
* ADS-Bの受信には`dump1090-mutability`の`1.15~dev`を使用
* `fr24feed`は最新版にsegfaultのバグがある(?)ようなので、古いバージョン(`1.0.18-5`)を使用

## Depends

* Docker
  * ubuntu:latest
* [dump1090-mutability_1.15~dev](https://github.com/mutability/dump1090/tree/unmaintained)
* fr24feed_1.0.18-5

## Installation

### 1. config fr24feed.ini

```
vi resources/fr24feed.ini
```

* このファイルにはfr24feedの設定の一部が含まれている
* レーダーサイトの座標情報等は恐らくFlightradar24側に保存されていて、SHARING KEYでアクセスする形になっている
* 既存の環境からコピーしてくるのが手っ取り早い

```
fr24key=""
```

* Insert your SHARING KEY

```
fr24key="example1549example"
```

* example

### 2. prepare dump1090-mutability deb package

* Built dump1090-mutability 1.15~dev deb package
* Install in `resources/`

### 3. prepare fr24feed

* fr24feed 1.0.18-5 binary
* Install in `resources/`
* [link](http://feed.flightradar24.com/linux/fr24feed_1.0.18-5_amd64.tgz)

### 4. chack necessary files

```
$ ls resources/
dump1090-mutability_1.15~dev_amd64.deb  fr24feed  fr24feed.ini
```

* Built dump1090-mutability 1.15~dev deb package
* fr24feed 1.0.18-5 binary
* fr24feed.ini config file

### 5. check and set dongle bus

```
$ lsusb | grep "Realtek Semiconductor Corp. RTL2838 DVB-T"
Bus 001 Device 007: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838 DVB-T
```

* check dongle bus No. and Device No.

```
$ vi utils/run.sh
```

```
DONGLE_BUS="001/007"
```

* Insert bus No. and Device No.

## Usege

```
utils/run.sh
```

* start container and data feeding.
