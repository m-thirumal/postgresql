# Build from source in Ubuntu

* Create `build` directory and change the ownership of folder

```bash
sudo mkdir /build

sudo chown -R ubuntu:ubuntu /build
```

* Get/Download the source 

```bash
wget -q -O - https://github.com/pgbackrest/pgbackrest/archive/release/2.53.1.tar.gz | tar zx -C /build
```

* Install build dependencies

```bash
sudo apt-get install make gcc libpq-dev libssl-dev libxml2-dev pkg-config liblz4-dev libzstd-dev libbz2-dev libz-dev
```

* Configure and compile pgBackRest

```bash
cd /build/pgbackrest-release-2.53.1/src && ./configure && make
```