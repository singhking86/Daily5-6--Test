#!/bin/sh
# Gradle start up script. Requires gradle/wrapper/gradle-wrapper.jar, which
# Android Studio regenerates automatically on project sync. If running from
# the CLI without Android Studio, run `gradle wrapper --gradle-version 8.7`
# once (with a local Gradle install) to (re)create that jar first.
DIR="$(cd "$(dirname "$0")" && pwd)"
exec java -jar "$DIR/gradle/wrapper/gradle-wrapper.jar" "$@"
