#!/usr/bin/env bash
# Ad-hoc code-sign the local Electron dev binary so macOS XProtect stops
# flagging it as malware and trashing it on launch. Recent XProtect signatures
# false-match the unsigned universal Electron that npm downloads; an ad-hoc
# signature (-) plus clearing quarantine makes `npm start` reliable again.
#
# Runs on `postinstall` (fresh download) and `prestart` (every dev launch).
# Never fails the calling script: this is a convenience, not a build step.
set -u

APP="node_modules/electron/dist/Electron.app"

# macOS only, and only if the binary is actually there.
[ "$(uname)" = "Darwin" ] || exit 0
[ -d "$APP" ] || exit 0

codesign --force --deep --sign - "$APP" >/dev/null 2>&1 || true
xattr -cr "$APP" >/dev/null 2>&1 || true
exit 0
