#!/bin/bash

flask translate compile

export ELASTICSEARCH_URL=$SEARCHBOX_SSL_URL

export MAIL_SERVER=$MAILGUN_SMTP_SERVER
export MAIL_PORT=$MAILGUN_SMTP_PORT
export MAIL_USERNAME=$MAILGUN_SMTP_LOGIN
export MAIL_PASSWORD=$MAILGUN_SMTP_PASSWORD
export MAIL_USE_TLS=1

gunicorn microblog:app