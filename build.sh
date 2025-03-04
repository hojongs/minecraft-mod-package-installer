#!/usr/bin/env bash

set -eu

# Default distribution if not provided
distribution="${1:-os-SNAPSHOT}"

echo "Building distribution: $distribution"

# Check if distribution contains 'Windows'
if [[ "$distribution" == *Windows* ]]; then
    fileExt="exe"
    opt=""
else
    fileExt="app"
    opt="--target-architecture universal2"
fi

# Universal build for different platforms
pyinstaller \
  --onefile \
  --add-data "mods/*.jar:mods/" \
  --name="minecraft-mod-package-installer-$distribution.$fileExt" \
  $opt \
  main.py
