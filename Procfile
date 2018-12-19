release: flask db upgrade
web: flask translate compile; env ELASTICSEARCH_URL=$SEARCHBOX_SSL_URL gunicorn microblog:app
