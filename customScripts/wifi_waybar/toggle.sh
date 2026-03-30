#!/usr/bin/env bash

statefile=$(dirname $0)/.state

case $(cat $statefile) in
name) echo "ip" > $statefile ;;
ip) echo "name" > $statefile ;;
esac
