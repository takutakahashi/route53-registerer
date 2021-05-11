#!/bin/bash -e

if [[ "$RECORD_NAME" = "" ]]; then
  exit 1
fi
if [[ "$TYPE" = "" ]]; then
  exit 1
fi
if [[ "$VAL" = "" ]]; then
  exit 1
fi
if [[ "$HOSTED_ZONE_ID" = "" ]]; then
  exit 1
fi

if [[ "$DEBUG" = "true" ]]; then
  DEBUG="--debug"
else
  DEBUG=""
fi

if [[ "$ALIAS" = "true" ]]; then
  python lib/parse_j2.py lib/route53_alias.json.j2 > file.json
else
  python lib/parse_j2.py lib/route53.json.j2 > file.json
fi
echo "---------- request below ------------"
cat file.json
echo "---------- request above ------------"
if [[ "$DRY_RUN" != "true" ]]; then
  aws $DEBUG route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID --change-batch file://file.json
fi
