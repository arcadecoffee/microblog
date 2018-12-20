#!/bin/bash

flask db upgrade

if [ $ELASTICSEARCH_URL ]; then
    curl -sX PUT $ELASTICSEARCH_URL/post
    flask search reindex
fi
