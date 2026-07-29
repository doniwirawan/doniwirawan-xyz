#!/usr/bin/env bash
# Re-read the newest Internet Archive snapshot for each URL and write the
# index. The snapshots were requested during capture; this only reads them back.
set -u

DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="$DIR/archive-urls.md"

{
  echo "# Portfolio archive"
  echo
  echo "Captured $(date '+%d %B %Y'). Screenshots live in \`screenshots/\`;"
  echo "the Wayback links are dated public snapshots on the Internet Archive."
  echo
  echo "| Site | Screenshot | Wayback snapshot |"
  echo "| --- | --- | --- |"
} > "$OUT"

while IFS=$'\t' read -r url shot png _; do
  [ -z "$url" ] && continue
  host=$(printf '%s' "$url" | sed -E 's|https?://||; s|/.*||; s|^www\.||')

  # The CDX index rather than /wayback/available: same data, and it does not
  # start returning 429 a dozen URLs in.
  stamp=$(curl -s -m 30 \
    "http://web.archive.org/cdx/search/cdx?url=$url&output=json&limit=-1&filter=statuscode:200&fl=timestamp" \
    | grep -oE '"[0-9]{14}"' | tail -1 | tr -d '"')

  if [ -n "$stamp" ]; then
    link="[$(echo "$stamp" | sed -E 's/^(....)(..)(..).*/\1-\2-\3/')](https://web.archive.org/web/$stamp/$url)"
  else
    link="not archived"
  fi

  printf '| [%s](%s) | `screenshots/%s` | %s |\n' "$host" "$url" "$png" "$link" >> "$OUT"
  echo "resolved: $host -> ${snap:-none}"
  sleep 3
done < "$DIR/results.tsv"

echo "wrote $OUT"
