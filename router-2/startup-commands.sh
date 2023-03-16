#!/bin/bash

# IP table routing rule
ip route add 10.0.1.0/24 via 10.0.4.2 # To Router 1
ip route add 10.0.3.0/24 via 10.0.4.4 # To Router 3

# Run the HTTPd server to be able to serve data
# Also makes sure that the container does not exit
httpd-foreground
