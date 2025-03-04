#!/usr/bin/env bash

set -eu

# Default distribution if not provided
distribution="${1:-os-SNAPSHOT}"

echo "Building distribution: $distribution"

opt='--onefile --add-data "mods/*.jar:mods/"'
if [[ "$distribution" == *Windows* ]]; then
  filename="minecraft-mod-package-installer-$distribution.exe"
  pyinstaller \
    $opt \
    --name=$filename \
    main.py
else
  filename="minecraft-mod-package-installer-$distribution.app"
  pyinstaller \
    $opt \
    --name=$filename \
    --target-architecture universal2 \
    main.py

  outdir=dist
  zip -r "$outdir/$filename.zip" "$outdir/$filename"
  rm "$outdir/$filename"
fi
