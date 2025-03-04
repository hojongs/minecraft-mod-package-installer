#!/usr/bin/env bash

set -eu

# Default distribution if not provided
distribution="${1:-os-SNAPSHOT}"

echo "Building distribution: $distribution"

if [[ "$distribution" == *Windows* ]]; then
  filename="minecraft-mod-package-installer-$distribution.exe"
  pyinstaller \
    --onefile \
    --add-data "mods/*.jar:mods/" \
    --name=$filename \
    main.py
else
  filename="minecraft-mod-package-installer-$distribution"
  pyinstaller \
    --onefile \
    --add-data "mods/*.jar:mods/" \
    --name=$filename \
    --target-architecture universal2 \
    main.py

  cd dist
  zip -r "$filename.zip" "$filename"
  rm -rf "$filename"
  cd ..
fi
