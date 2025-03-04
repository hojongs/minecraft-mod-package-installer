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
    --windowed \
    --name=$filename \
    main.py

  choco install zip
  cd dist
  zip -j "$filename.zip" "$filename"
  rm -rf "$filename"
  cd ..
else
  filename="minecraft-mod-package-installer-$distribution.app"
  pyinstaller \
    --onefile \
    --add-data "mods/*.jar:mods/" \
    --windowed \
    --name=$filename \
    --target-architecture universal2 \
    main.py

  cd dist
  zip -r "$filename.zip" "$filename"
  rm -rf "$filename"
  cd ..
fi
