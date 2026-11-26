#!/bin/bash
# Double-click in Finder to run tool/build_check.sh (logs go to build_logs/).
cd "$(dirname "$0")/.." || exit 1
bash tool/build_check.sh "$@" 2>&1 | tee build_logs/run.log
echo; echo "Finished. You can close this window."
