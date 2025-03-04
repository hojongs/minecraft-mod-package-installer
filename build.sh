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
filename="minecraft-mod-package-installer-$distribution.$fileExt"
pyinstaller \
  --onefile \
  --add-data "mods/*.jar:mods/" \
  --name=$filename \
  $opt \
  main.py

zip -r "$filename.zip" "$filename"
