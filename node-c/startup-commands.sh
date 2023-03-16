#!/bin/bash

# IP table routing rule
ip route add 10.0.0.0/16 via 10.0.3.2 # To Router 3

# Run the HTTPd server to be able to serve data
# Also makes sure that the container does not exit
httpd-foreground
