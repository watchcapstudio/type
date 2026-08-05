#!/bin/bash
# Polls ASC until the newest build for Type finishes processing. Prints state
# transitions; exits when VALID / FAILED / INVALID.
set -u
KID=353ZMTW2J9
ISS=69a6de8a-c307-47e3-e053-5b8c7c11a4d1
KEYPATH="$HOME/.appstoreconnect/private_keys/AuthKey_353ZMTW2J9.p8"
BUNDLE_ID=com.watchcapstudio.type

# Resolved rather than hardcoded: the app id is per-account and changed when
# the apps moved to the BTTY LLC team.
APP_ID=$(curl -s -H "Authorization: Bearer $(KID=$KID ISS=$ISS KEYPATH=$KEYPATH node "$(dirname "$0")/asc-jwt.mjs")" \
  "https://api.appstoreconnect.apple.com/v1/apps?filter%5BbundleId%5D=$BUNDLE_ID" \
  | python3 -c 'import json,sys
d = json.load(sys.stdin).get("data", [])
print(d[0]["id"] if d else "")')
[ -n "$APP_ID" ] || { echo "no app record for $BUNDLE_ID — create it in App Store Connect first"; exit 1; }

while true; do
  JWT=$(KID=$KID ISS=$ISS KEYPATH=$KEYPATH node "$(dirname "$0")/asc-jwt.mjs")
  STATE=$(curl -s -H "Authorization: Bearer $JWT" \
    "https://api.appstoreconnect.apple.com/v1/builds?filter%5Bapp%5D=$APP_ID&limit=1&fields%5Bbuilds%5D=version,processingState" \
    | python3 -c 'import json,sys
d = json.load(sys.stdin).get("data", [])
print((d[0]["attributes"]["processingState"] + " build " + d[0]["attributes"]["version"]) if d else "NONE")' 2>/dev/null)
  echo "$(date +%H:%M:%S) ${STATE:-poll-error}"
  case "${STATE:-}" in
    VALID*|FAILED*|INVALID*) exit 0 ;;
  esac
  sleep 60
done
