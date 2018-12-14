#!/bin/bash

git clone https://github.com/arcadecoffee/microblog ~/microblog
cd microblog
git fetch origin && git reset --hard origin/master && git clean -f -d
git checkout chapter-17

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install gunicorn pymysql

touch .env
chmod 600 .env
cat >.env <<EOL
SECRET_KEY=$(python3 -c "import secrets; print(secrets.token_urlsafe(24))")
MAIL_SERVER=localhost
MAIL_PORT=25
DATABASE_URL=mysql+pymysql://microblog:$DATABASE_PASSWORD@localhost:3306/microblog
MS_TRANSLATOR_KEY=$MS_TRANSLATOR_KEY
EOL

echo "export FLASK_APP=microblog.py >> ~/.profile"

flask translate compile
