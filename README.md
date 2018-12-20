# microblog

## setup
```Shell
pipenv install
```

## server configuration
### environment
```Shell
FLASK_APP=microblog.py

# CSRF key - set to random string
SECRET_KEY=<secret key>

# defaults to local sqlite database
# DATABASE_URL=postgres://<username>:<password>@localhost:5432/microblog
# DATABASE_URL=mysql+pymysql://<username>:<password>@localhost:3306/microblog

# Elasticsearch Service - unset to not use search index
ELASTICSEARCH_URL=https://localhost:9200

# set to 'development', 'test', or 'production' - defaults to 'production'
FLASK_ENV=development

# unset to log to logs/microblog.log file
LOG_TO_STDOUT=1

# Emailer settings - unset to disable
# local sendmail instance
MAIL_SERVER=localhost
MAIL_PORT=25
#
# run local debugging SMTP server
# python -m smtpd -n -c DebuggingServer localhost:8026
#
# external mail service 
# MAIL_USERNAME=<username>
# MAIL_PASSWORD=<password>
# MAIL_PORT=587
# MAIL_SERVER=smtp.mailer.com
# MAIL_USE_TLS=1

# Azure translation API key
# Unset to disable translator integration
MS_TRANSLATOR_KEY=<API key>
```

## generating secrets and passworks
```Shell
python3 -c 'import secrets; print(secrets.token_urlsafe(24))'
```

## setup
```Shell
flask translate compile
flask search reindex
```

## start
```Shell
flask run
```
