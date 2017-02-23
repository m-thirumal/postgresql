# Install dependencies, create a virtual environment, download, install & configure

sudo apt-get install virtualenv python-pip libpq-dev python-dev

cd
virtualenv pgadmin4
cd pgadmin4
source bin/activate

wget https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.2/pip/pgadmin4-1.2-py2-none-any.whl

pip install pgadmin4-1.2-py2-none-any.whl

vi lib/python2.7/site-packages/pgadmin4/config_local.py

# Add the following line in the file
SERVER_MODE = False

# Configure 
python lib/python2.7/site-packages/pgadmin4/setup.py

# Run
python lib/python2.7/site-packages/pgadmin4/pgAdmin4.py

