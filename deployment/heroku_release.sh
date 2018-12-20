#!/bin/bash

flask db upgrade
if [ $SEARCHBOX_SSL_URL ]
    then
        curl -X PUT $SEARCHBOX_SSL_URL/post
    fi
