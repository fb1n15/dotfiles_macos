#!/usr/bin/env zsh

function pidwait () {
  while kill -0 "$1"
  do
    echo "Process $1 is still running..."
    sleep 3
  done
  echo "Process $1 is done"
}