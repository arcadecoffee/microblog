#!/bin/bash

flask db upgrade
curl -f -X PUT $SEARCHBOX_SSL_URL/post
