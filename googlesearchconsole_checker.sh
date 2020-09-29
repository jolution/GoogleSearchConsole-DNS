#!/bin/bash

# GoogleSearchConsole DNS TXT Record Check

#     _       _       _   _             
#    (_) ___ | |_   _| |_(_) ___  _ __  
#    | |/ _ \| | | | | __| |/ _ \| '_ \ 
#    | | (_) | | |_| | |_| | (_) | | | |
#   _/ |\___/|_|\__,_|\__|_|\___/|_| |_|
#  |__/                                 
#
# Monitoring Google Search Console DNS Entry by Jolution.de
# v0.1

if [ $# -eq 0 ]; then
    echo "No arguments supplied ❌"
    exit 10
fi

DOMAINURL=$1
#NOTIFYEMAIL=info@jolution.de

dig -t txt "$DOMAINURL" +short | grep "google-site-verification" > /dev/null 2>&1
if [ $? -ne 1 ]
then
    echo "DNS entry for "$DOMAINURL" exists ✅"
    #echo "This is message body" | mail -s "This is Subject" "$NOTIFYEMAIL"
else
    echo "No DNS entry for "$DOMAINURL" exists ❌"
fi
