#!/bin/bash

flask db upgrade
if [ $SEARCHBOX_SSL_URL ]
    then
        curl -f -X PUT $SEARCHBOX_SSL_URL/post
    fi
