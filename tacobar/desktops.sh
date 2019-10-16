#!/usr/bin/env bash

echo $(/usr/local/bin/chunkc tiling::query --desktop id)

for i in {1..9}
do
    windows=$(/usr/local/bin/chunkc tiling::query --windows-for-desktop $i)
    if [ -n "$windows" ]
    then
        echo "active"
    else
        echo "inactive"
    fi
done
