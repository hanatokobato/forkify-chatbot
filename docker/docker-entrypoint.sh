#!/bin/bash

# Exit on fail
set -e

# Bundle install
bundle install --jobs=4

# Waiting for dependent containers
/wait-for-it.sh -c 'nc -z bot-psql 5432'

# Start services
stealth server

# Finally call command issued to the docker service
exec "$@"
