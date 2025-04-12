#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install apache2
sudo service apache2 start
sudo service apache2 status

sudo cp ../apache-html/*.html /var/www/html/
