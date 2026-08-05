#!/bin/bash
# Waits for the newest Type Only build to finish ASC processing, attaches it
# to the "early readers" external group, and submits it for Beta App Review.
set -u
KID=353ZMTW2J9
ISS=69a6de8a-c307-47e3-e053-5b8c7c11a4d1
KEYPATH="$HOME/.appstoreconnect/private_keys/AuthKey_353ZMTW2J9.p8"
BUNDLE_ID=com.watchcapstudio.type
GROUP_NAME="early readers"

jwt() { KID=$KID ISS=$ISS KEYPATH=$KEYPATH node "$(dirname "$0")/asc-jwt.mjs"; }

# App and group ids are looked up rather than hardcoded: they're per-account,
# and both changed when the apps moved to the BTTY LLC team.
APP_ID=$(curl -s -H "Authorization: Bearer $(jwt)" \
  "https://api.appstoreconnect.apple.com/v1/apps?filter%5BbundleId%5D=$BUNDLE_ID" \
  | python3 -c 'import json,sys
d = json.load(sys.stdin).get("data", [])
print(d[0]["id"] if d else "")')
[ -n "$APP_ID" ] || { echo "no app record for $BUNDLE_ID — create it in App Store Connect first"; exit 1; }

GROUP_ID=$(curl -s -H "Authorization: Bearer $(jwt)" \
  "https://api.appstoreconnect.apple.com/v1/apps/$APP_ID/betaGroups?limit=200" \
  | python3 -c "import json,sys
d = json.load(sys.stdin).get('data', [])
m = [g['id'] for g in d if g['attributes']['name'].lower() == '$GROUP_NAME']
print(m[0] if m else '')")
[ -n "$GROUP_ID" ] || { echo "no beta group named '$GROUP_NAME' on app $APP_ID"; exit 1; }
echo "app $APP_ID, group $GROUP_ID"

echo "waiting for the build to process…"
BUILD_ID=""
for i in $(seq 1 90); do
  RES=$(curl -s -H "Authorization: Bearer $(jwt)" \
    "https://api.appstoreconnect.apple.com/v1/builds?filter%5Bapp%5D=$APP_ID&limit=1&sort=-uploadedDate&fields%5Bbuilds%5D=version,processingState")
  STATE=$(echo "$RES" | python3 -c 'import json,sys
d = json.load(sys.stdin).get("data", [])
print(d[0]["attributes"]["processingState"] if d else "NONE")' 2>/dev/null)
  echo "$(date +%H:%M:%S) $STATE"
  if [ "$STATE" = "VALID" ]; then
    BUILD_ID=$(echo "$RES" | python3 -c 'import json,sys; print(json.load(sys.stdin)["data"][0]["id"])')
    break
  fi
  if [ "$STATE" = "FAILED" ] || [ "$STATE" = "INVALID" ]; then
    echo "build processing failed: $STATE"; exit 1
  fi
  sleep 60
done
[ -n "$BUILD_ID" ] || { echo "timed out waiting for processing"; exit 1; }
echo "build is VALID: $BUILD_ID"

echo "attaching build to the early readers group…"
curl -s -w " [%{http_code}]\n" -X POST -H "Authorization: Bearer $(jwt)" -H "Content-Type: application/json" \
  -d "{\"data\":[{\"type\":\"builds\",\"id\":\"$BUILD_ID\"}]}" \
  "https://api.appstoreconnect.apple.com/v1/betaGroups/$GROUP_ID/relationships/builds" | tail -1

echo "submitting for Beta App Review…"
curl -s -w "\n[%{http_code}]\n" -X POST -H "Authorization: Bearer $(jwt)" -H "Content-Type: application/json" \
  -d "{\"data\":{\"type\":\"betaAppReviewSubmissions\",\"relationships\":{\"build\":{\"data\":{\"type\":\"builds\",\"id\":\"$BUILD_ID\"}}}}}" \
  "https://api.appstoreconnect.apple.com/v1/betaAppReviewSubmissions" | tail -4
echo "done"
