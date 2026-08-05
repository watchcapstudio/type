#!/bin/bash
# Polls App Store Connect for the "type" app record (created manually in the
# ASC website — the one step the API can't do), then uploads the archived
# build the moment it appears. Safe to re-run; gives up after 4 hours.
set -u
cd "$(dirname "$0")"

KID=353ZMTW2J9
ISS=69a6de8a-c307-47e3-e053-5b8c7c11a4d1
KEYPATH="$HOME/.appstoreconnect/private_keys/AuthKey_353ZMTW2J9.p8"

jwt() {
  KID=$KID ISS=$ISS KEYPATH=$KEYPATH node /Users/kellyvohs/Projects/type/ios/scripts/asc-jwt.mjs
}

echo "waiting for the app record (bundle com.watchcapstudio.type) to exist in ASC…"
for i in $(seq 1 240); do
  COUNT=$(curl -s -H "Authorization: Bearer $(jwt)" \
    "https://api.appstoreconnect.apple.com/v1/apps?filter%5BbundleId%5D=com.watchcapstudio.type" \
    | python3 -c 'import json,sys; print(len(json.load(sys.stdin).get("data",[])))' 2>/dev/null)
  if [ "${COUNT:-0}" -ge 1 ]; then
    echo "app record found — uploading the build…"
    xcodebuild -exportArchive \
      -archivePath build/type.xcarchive \
      -exportOptionsPlist ExportOptions.plist \
      -exportPath build/export \
      -allowProvisioningUpdates \
      -authenticationKeyID "$KID" \
      -authenticationKeyIssuerID "$ISS" 2>&1 | tail -20
    exit $?
  fi
  sleep 60
done
echo "gave up after 4 hours — app record never appeared"
exit 1
