#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -y update
apt-get -y install python3 python3-venv python3-dev
apt-get -y install mysql-server postfix supervisor nginx git
