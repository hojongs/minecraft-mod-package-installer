#!/usr/bin/env bash

# Default distribution if not provided
distribution="${1:os-SNAPSHOT}"

# Print the distribution to verify
echo "Building distribution: $distribution"

# Run pyinstaller to build the project with the distribution
pyinstaller \
  --onefile \
  --add-data "mods/*.jar:mods/" \
  --name="minecraft-mod-package-installer-$distribution" \
  main.py
