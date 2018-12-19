#!/bin/bash

flask db upgrade
curl -X PUT $(SEARCHBOX_SSL_URL)/post
