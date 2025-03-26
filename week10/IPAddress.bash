#!/usr/bin/env bash

ip addr | awk '/inet *.* brd/ {print $2}' | cut -d '/' -f 1
