#!/usr/bin/env bash

# Upgrades the sideloaded Tailscale client on the Android device plugged in via USB
# to the latest official release from GitHub.

set -euo pipefail

PACKAGE=com.tailscale.ipn
RELEASE_API=https://api.github.com/repos/tailscale/tailscale-android/releases/latest

installed_version() {
  local dump
  dump=$(adb shell -n dumpsys package "$PACKAGE")
  sed -n 's/^ *versionName=//p' <<<"$dump" | head -n1 | tr -d '\r'
}

if ! state=$(adb get-state 2>&1) || [ "$state" != device ]; then
  echo "No usable device found via adb: $state" >&2
  exit 1
fi

model=$(adb shell -n getprop ro.product.model | tr -d '\r')
installed=$(installed_version)

release=$(curl -fsSL "$RELEASE_API")
# The tag has the same format as the versionName reported by the device.
latest=$(jq -r '.tag_name' <<<"$release")
asset=$(jq -c '[.assets[] | select(.name | endswith(".apk"))] | first' <<<"$release")
url=$(jq -r '.browser_download_url // empty' <<<"$asset")
sha256=$(jq -r '.digest // empty' <<<"$asset" | sed 's/^sha256://')

if [ -z "$url" ] || [ -z "$sha256" ]; then
  echo "Couldn't find an APK with a checksum in release $latest" >&2
  exit 1
fi

echo "Device:    $model"
echo "Installed: ${installed:-not installed}"
echo "Latest:    $latest"

if [ "$installed" = "$latest" ]; then
  echo "Already up to date."
  exit 0
fi

read -r -p "Install $latest? [y/N] " answer
[[ "$answer" =~ ^[Yy]$ ]] || exit 0

tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT
apk="$tmp_dir/tailscale.apk"

curl -fL --progress-bar -o "$apk" "$url"
echo "$sha256  $apk" | sha256sum --check --quiet

# -r keeps the app's data. It fails without touching the installed app if the
# APK is signed with a different key or is older than the installed version.
adb install -r "$apk"

echo "Now running: $(installed_version)"
