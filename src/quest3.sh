#!/bin/bash

OLD_DIR="door_management_fi"
NEW_DIR="door_management_files"

if [ ! -d "$OLD_DIR" ]; then
    exit 1
fi

mv "$OLD_DIR" "$NEW_DIR"

cd "$NEW_DIR" || exit

mkdir -p door_configuration door_logs door_map

mv *.conf 2>/dev/null door_configuration/
mv *.log 2>/dev/null door_logs/
mv *.1 2>/dev/null door_map/

