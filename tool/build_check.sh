#!/usr/bin/env bash
# Builds the app with Flutter 3.47 (see .fvmrc) and writes every log to
# build_logs/ (git-ignored), so results can be reviewed afterwards.
#
# Usage (from anywhere):
#   bash tool/build_check.sh            # pub get + analyze + Android debug APK
#   bash tool/build_check.sh ios        # ...plus an unsigned iOS simulator build
#   FLAVOR=jcc bash tool/build_check.sh # other flavors: mzizicms (default), bwmc, dcik, jcc

set -u
cd "$(dirname "$0")/.."
LOG_DIR="build_logs"
mkdir -p "$LOG_DIR"
FLAVOR="${FLAVOR:-mzizicms}"

# --- Flutter 3.47 ------------------------------------------------------------------
FLUTTER_VERSION="3.47.2"
if [ -n "${FLUTTER:-}" ]; then :;
elif [ -x "$HOME/fvm/versions/$FLUTTER_VERSION/bin/flutter" ]; then FLUTTER="$HOME/fvm/versions/$FLUTTER_VERSION/bin/flutter";
else FLUTTER="flutter"; fi

# --- JDK 17+ (required by Android Gradle Plugin 9) --------------------------------
if [ -z "${JAVA_HOME:-}" ] || ! "$JAVA_HOME/bin/java" -version 2>&1 | grep -qE '"(17|21)\.'; then
  for v in 21 17; do
    if J=$(/usr/libexec/java_home -v "$v" 2>/dev/null); then export JAVA_HOME="$J"; break; fi
  done
  if [ -z "${JAVA_HOME:-}" ] && [ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]; then
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
  fi
fi

step() {  # step <name> <command...>
  local name="$1"; shift
  echo "==> $name"
  { echo "\$ $*"; "$@"; echo "exit=$?"; } >"$LOG_DIR/$name.log" 2>&1
  tail -n 1 "$LOG_DIR/$name.log"
}

{
  echo "date: $(date)"
  echo "flutter: $FLUTTER"
  echo "JAVA_HOME: ${JAVA_HOME:-<unset>}"
  "${JAVA_HOME:+$JAVA_HOME/bin/}java" -version 2>&1
  xcodebuild -version 2>&1
  pod --version 2>&1 | sed 's/^/cocoapods: /'
} >"$LOG_DIR/00_env.log" 2>&1

step 01_flutter_version $FLUTTER --version
step 02_pub_get        $FLUTTER pub get
step 03_analyze        $FLUTTER analyze --no-fatal-infos --no-fatal-warnings
step 04_build_apk      $FLUTTER build apk --debug --flavor "$FLAVOR"

if [ "${1:-}" = "ios" ]; then
  step 05_build_ios    $FLUTTER build ios --simulator --debug --no-codesign
fi

echo "Done. Logs are in $LOG_DIR/"
