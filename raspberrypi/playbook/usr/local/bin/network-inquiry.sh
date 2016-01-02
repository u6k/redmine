#!/bin/bash

if [ -z $NETWORK_INQUIRY_HOST ]; then
    logger -i -p user.warn -t network_inquiry NETWORK_INQUIRY_HOST env empty.
    exit 1;
fi

ping $NETWORK_INQUIRY_HOST -c 1 >> /dev/null

if [ $? -eq 0 ]; then
    logger -i -p user.info -t network_inquiry ok
else
    logger -i -p user.warn -t network_inquiry restarting
    service networking restart
fi
