#!/usr/bin/env bash
# Capture a screenshot of each portfolio URL and submit it to the Internet Archive.
# Run from the repo root: bash archive/capture.sh
set -u

CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
DIR="$(cd "$(dirname "$0")" && pwd)"
SHOTS="$DIR/screenshots"
PROFILE="$DIR/.chrome-profile"
RESULTS="$DIR/results.tsv"

mkdir -p "$SHOTS"
: > "$RESULTS"

while read -r url; do
  [ -z "$url" ] && continue
  host=$(printf '%s' "$url" | sed -E 's|https?://||; s|/.*||; s|^www\.||')
  out="$SHOTS/$host.png"

  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --user-data-dir="$PROFILE" \
    --window-size=1440,2400 --virtual-time-budget=15000 \
    --screenshot="$(cygpath -w "$out")" "$url" >/dev/null 2>&1

  if [ -s "$out" ]; then shot="ok"; else shot="FAILED"; fi

  # Ask the Internet Archive to take a fresh snapshot, then read back the
  # newest one it holds. Anonymous saves are rate limited, so give it room.
  curl -s -m 90 -o /dev/null "https://web.archive.org/save/$url"
  sleep 8
  # The response carries the queried url as well as the snapshot's, so pick the
  # one pointing at web.archive.org rather than simply the first match.
  snap=$(curl -s -m 30 "https://archive.org/wayback/available?url=$url" \
    | grep -oE '"url": *"[^"]*web\.archive\.org[^"]*"' | head -1 \
    | sed -E 's/.*"url": *"//; s/"$//')
  [ -z "$snap" ] && snap="none"

  printf '%s\t%s\t%s\t%s\n' "$url" "$shot" "$host.png" "$snap" >> "$RESULTS"
  echo "done: $url ($shot)"
  sleep 4
done < "$DIR/urls.txt"

echo "ALL DONE"
