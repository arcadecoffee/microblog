#!/bin/bash

flask db upgrade

if [ $SEARCHBOX_SSL_URL ]; then
    curl -sX PUT $SEARCHBOX_SSL_URL/post
    flask search reindex
fi
