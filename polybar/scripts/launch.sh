#!/usr/bin/env bash

# terminate existing polybar instances
killall -q polybar

# launch polybar
echo "---" | tee -a /tmp/toppolybar.log
polybar top >> /tmp/toppolybar.log
