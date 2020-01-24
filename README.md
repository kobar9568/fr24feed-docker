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

### 1. Configure fr24feed.ini

```
$ vi resources/fr24feed.ini
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

### 2. Prepare dump1090-mutability deb package

* Built dump1090-mutability 1.15~dev deb package
* Install in `resources/`

### 3. Prepare fr24feed binary

* fr24feed 1.0.18-5 binary
* Install in `resources/`
* [link](http://feed.flightradar24.com/linux/fr24feed_1.0.18-5_amd64.tgz)

### 4. Check necessary files

```
$ ls resources/
dump1090-mutability_1.15~dev_amd64.deb  fr24feed  fr24feed.ini
```

* Built dump1090-mutability 1.15~dev deb package
* fr24feed 1.0.18-5 binary
* fr24feed.ini config file

## Usege

### 1. Build Docker image

```
$ utils/build_image.sh
```

### 2. Create container and start data feeding

```
$ utils/create_container.sh
```
