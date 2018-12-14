#!/bin/bash

DB_PWD=$(python3 -c "import secrets; print(secrets.token_urlsafe(32))")

git clone https://github.com/arcadecoffee/microblog ~/microblog
cd microblog
git checkout v0.17

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install gunicorn pymysql

cat >.env <<EOL
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_urlsafe(32))")
MAIL_SERVER=localhost
MAIL_PORT=25
DATABASE_URL=mysql+pymysql://microblog:$DB_PWD@localhost:3306/microblog
MS_TRANSLATOR_KEY=$MS_TRANSLATOR_KEY
EOL

echo "export FLASK_APP=microblog.py >> ~/.profile"

flask translate compile
