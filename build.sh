#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}"

ANTENNAPOD_LOG_FILE="${ANTENNAPOD_LOG_FILE:-/tmp/build_antennapod.log}"

./gradlew --stop
./gradlew --no-daemon clean assembleDebug &> "${ANTENNAPOD_LOG_FILE}"

if [[ $? -eq 0 ]]
then
        echo "BUILD SUCCESSFUL!"
        ./gradlew --stop
        exit 0
else
        echo "FAIL"
        ./gradlew --stop
        exit 1
fi
