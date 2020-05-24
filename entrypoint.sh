#!/bin/bash -xe

RECORD=$1
ADDRESS=$2
ZONE=`python lib/detect_zone.py $RECORD |jq -r '.zone' `
DOMAIN=`python lib/detect_zone.py $RECORD |jq -r '.record' `
ZONE_ID=`aws route53 list-hosted-zones |jq -r --arg ZONE "${ZONE}." ' .[] |select (.[].Name == $ZONE) | .[].Id '`
