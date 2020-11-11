## Build from source in Ubuntu

1. Create `build` directory and change the ownership of folder

        sudo mkdir /build

        sudo chown -R thirumal:thirumal /build

2. Get/Download the source 

    wget -q -O - https://github.com/pgbackrest/pgbackrest/archive/release/2.30.tar.gz | tar zx -C /build

3. Install build dependencies


        sudo apt-get install make gcc libpq-dev libssl-dev libxml2-dev pkg-config liblz4-dev libzstd-dev libbz2-dev libz-dev

4. Configure and compile pgBackRest

        cd /build/pgbackrest-release-2.30/src && ./configure && make