#!/bin/bash

echo "Waiting for postgres..."

# Wait fot the app service to com up
/app/wait_for_it.sh postgres:5432 --timeout=35 --strict

echo "PostgreSQL started"

gunicorn --config ./gunicorn.py "{{cookiecutter.app_name}}.app:create_app()"
