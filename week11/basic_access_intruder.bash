#!/usr/bin/env bash

ip="$(bash ../week10/IPAddress.bash)"

for i in {0..19}; do
    curl "$ip"
done
