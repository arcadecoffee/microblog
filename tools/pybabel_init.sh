#!/bin/bash

pipenv run pybabel init -i messages.pot -d app/translations -l $1
