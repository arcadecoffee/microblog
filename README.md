# microblog

## setup
```Shell
pipenv install
```

## server configuration
### .flaskenv
```
FLASK_APP=microblog.py
```

### .env
```
FLASK_ENV=development

SECRET_KEY=<secret key>

# Azure translation API key
# MS_TRANSLATOR_KEY=<azure translator key>

# Elasticsearch Service
# ELASTICSEARCH_URL='http://localhost:9200'

# MySQL
# DATABASE_URL=mysql+pymysql://microblog:<db-password>@localhost:3306/microblog

# Debugging mail server: python -m smtpd -n -c DebuggingServer localhost:8025
# MAIL_SERVER=localhost
# MAIL_PORT=8025

# Local sendmail instance
# MAIL_SERVER=localhost
# MAIL_PORT=25

# External SMTP service
MAIL_SERVER=smtp.googlemail.com
MAIL_PORT=587
MAIL_USE_TLS=1
MAIL_USERNAME=<username>
MAIL_PASSWORD=<password>
```

## generating secrets and passworks
```
python3 -c 'import secrets; print(secrets.token_urlsafe(24))'
```

## setup
```
flask translate compile
flask search reindex
```

## start
```Shell
flask run
```
