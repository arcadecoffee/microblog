#!/bin/bash

pipenv run pybabel extract -F babel.cfg -k _l -o messages.pot .
