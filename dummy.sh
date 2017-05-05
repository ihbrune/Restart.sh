#!/bin/bash
# Just a small script as sparring partner for 'restart.sh'

trap "Can't TERM me!" SIGTERM

echo "DUMMY START!"

sleep 200

echo "DUMMY END!"
