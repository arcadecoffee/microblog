# microblog

## setup
```Shell
pipenv install
```

## server configuration
### .flaskenv
```
FLASK_APP=microblog.py

FLASK_ENV=development
```

### .env
```
SECRET_KEY=<secret key>

MS_TRANSLATOR_KEY=<azure translator key>

ELASTICSEARCH_URL='http://localhost:9200'

MAIL_SERVER=localhost
MAIL_PORT=8025

#MAIL_SERVER=smtp.googlemail.com
#MAIL_PORT=587
#MAIL_USE_TLS=1
#MAIL_USERNAME=<username>
#MAIL_PASSWORD=<password>
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
