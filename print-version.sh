#!/usr/bin/env bash

# Run headver.sh with default head=0 and build=0
version=$(./headver.sh head=0 build=0)

# Extract the version components from the headver.sh output
head_from_version=$(echo "$version" | cut -d. -f1)
yearweek_from_version=$(echo "$version" | cut -d. -f2)

# Get the latest tag from Git
latest_tag=$(git describe --tags --abbrev=0 | sed 's/^v//')

# Extract head and yearweek from the latest tag
head_from_latest_tag=$(echo "$latest_tag" | cut -d. -f1)
yearweek_from_latest_tag=$(echo "$latest_tag" | cut -d. -f2)
build_from_latest_tag=$(echo "$latest_tag" | cut -d. -f3)

# Compare head and yearweek between headver.sh output and latest tag
if [[ "$head_from_version" == "$head_from_latest_tag" && "$yearweek_from_version" == "$yearweek_from_latest_tag" ]]; then
    # If head and yearweek are the same, increment the build number
    next_build=$((build_from_latest_tag + 1))
    # echo "Build number is incremented to $next_build"
    # Run headver.sh again with the updated build number
    version=$(./headver.sh head=0 build=$next_build)
fi

# Final version output
echo $version
