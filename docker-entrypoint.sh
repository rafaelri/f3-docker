#!/bin/bash
set -e

if [ "$1" = 'f3' ]; then
  if [ "$OPERATION" = "WRITE" ] || [ "$OPERATION" = "ALL" ]; then
    gosu $USER f3write -p 1 $F3DATADIR
  fi
  if [ "$OPERATION" = "READ" ] || [ "$OPERATION" = "ALL" ]; then
    gosu $USER f3read -p 1 $F3DATADIR
  fi
  sleep $DELAY
else
  exec "$@"
fi
