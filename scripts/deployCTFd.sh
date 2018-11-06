#!/bin/sh -

#Script that download and run a new instance of CTFd
sudo git clone https://github.com/CTFd/CTFd.git
cd CTFd
python -c "import os; f=open('.ctfd_secret_key', 'a+'); f.write(os.urandom(64)); f.close()"
sudo docker-compose up