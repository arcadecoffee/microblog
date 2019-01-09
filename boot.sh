#!/bin/sh
source venv/bin/activate
while true; do
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Upgrade command failed, trying in 5 secs...
    sleep 5
done
flask translate compile
flask search reindex
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
