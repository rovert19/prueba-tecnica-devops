#!/bin/bash
set -x

nginx_runnnig = $(systemctl is-active nginx)
if [ "$nginx_running" == "active" ]; then
    service nginx stop 
fi