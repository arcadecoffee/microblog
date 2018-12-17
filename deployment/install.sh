#!/bin/bash

adduser --gecos "" --disabled-login --disabled-password microblog

git clone https://github.com/arcadecoffee/microblog /home/microblog/microblog
cd /home/microblog/microblog
git pull

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install gunicorn pymysql

touch .env
chmod 600 .env
cat >.env <<EOF
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_urlsafe(24))")
MAIL_SERVER=localhost
MAIL_PORT=25
DATABASE_URL=mysql+pymysql://microblog:$DATABASE_PASSWORD@localhost:3306/microblog
MS_TRANSLATOR_KEY=$MS_TRANSLATOR_KEY
EOF

mysql <<EOF
create database if not exists microblog character set utf8 collate utf8_bin;
create user if not exists 'microblog'@'localhost' identified by '$DATABASE_PASSWORD';
grant all privileges on microblog.* to 'microblog'@'localhost';
flush privileges;
EOF

flask translate compile
flask db upgrade

mkdir certs
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -keyout certs/key.pem -out certs/cert.pem \
    -subj "/C=US/ST=Fake/L=Temp/O=Unreal/CN=testing.domain"

chown -R microblog:microblog /home/microblog

cp deployment/supervisor/microblog.conf /etc/supervisor/conf.d/microblog.conf
cp deployment/nginx/microblog /etc/nginx/sites-enabled/microblog
rm /etc/nginx/sites-enabled/default

supervisorctl reload
service nginx reload
