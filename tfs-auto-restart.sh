#!/bin/bash
stdbuf -oL "./theforgottenserver" > data/logs/console.log 2>&1
sleep 1