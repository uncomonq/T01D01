#!/bin/bash

PIDS=$(ps aux | grep '[a]i_door_control.sh' | awk '{print $2}')

if [ "$PIDS" ]; then

    for PID in $PIDS; do
        kill "$PID" 2>/dev/null
        sleep 1
        if ps -p "$PID" > /dev/null 2>&1; then
            kill -9 "$PID"
        fi
    done
fi
