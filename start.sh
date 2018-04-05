#!/bin/sh

## Sample start script for WSGI application
exec gunicorn -b 0.0.0.0:8000 --chdir /usr/src -w 3 --error-logfile - --capture-output WSGI.APP
