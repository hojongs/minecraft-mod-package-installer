#!/usr/bin/env bash

# Default version if not provided
version="${1:-SNAPSHOT}"

# Print the version to verify
echo "Building version: $version"

# Run pyinstaller to build the project with the version
pyinstaller \
  --onefile \
  --add-data "mods/*.jar:mods/" \
  --name="minecraft-mod-package-installer-macos-v$version" \
  main.py
