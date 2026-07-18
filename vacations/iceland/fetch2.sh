#!/bin/bash
# Fetch via Commons search API -> thumburl, for items missing from pass 1
cd "$(dirname "$0")"
UA="IcelandBot/1.0 (tripiandkayshewa@gmail.com)"

fetch2() {
  key="$1"; query="$2"
  q=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$query")
  api="https://commons.wikimedia.org/w/api.php?action=query&generator=search&gsrsearch=${q}&gsrnamespace=6&gsrlimit=6&prop=imageinfo&iiprop=url|mime&iiurlwidth=760&format=json"
  # pick first result whose mime is image/jpeg or image/png
  turl=$(curl -s -A "$UA" "$api" | jq -r '[.query.pages[]? | .imageinfo[0] | select(.mime=="image/jpeg" or .mime=="image/png") | .thumburl] | .[0] // empty')
  if [ -z "$turl" ]; then echo "MISS2 $key ($query)"; sleep 0.2; return; fi
  curl -s -L -A "$UA" "$turl" -o "raw/$key.img"; sleep 0.2
  sips -s format jpeg -Z 600 -s formatOptions 68 "raw/$key.img" --out "raw/$key.jpg" >/dev/null 2>&1
  if [ ! -s "raw/$key.jpg" ]; then echo "SIPS2 $key"; return; fi
  printf 'data:image/jpeg;base64,' > "imgs/$key.txt"
  base64 -i "raw/$key.jpg" | tr -d '\n' >> "imgs/$key.txt"
  echo "OK2   $key  $(wc -c < imgs/$key.txt)b"
}

while IFS='|' read -r k q; do
  [ -z "$k" ] && continue
  fetch2 "$k" "$q"
done <<'EOF'
bruarfoss|Brúarfoss waterfall
faxi|Faxi waterfall Iceland
fridheimar|Friðheimar greenhouse tomato
secretlagoon|Secret Lagoon Gamla Laugin Fludir
gljufrabui|Gljúfrabúi waterfall
planewreck|Sólheimasandur DC-3 plane wreck
mulagljufur|Múlagljúfur canyon
vestrahorn|Vestrahorn Stokksnes
kjotsupa|Icelandic meat soup kjotsupa
harpa|Harpa concert hall Reykjavik
sunvoyager|Sun Voyager Solfar sculpture
EOF
echo "=== done2 ==="
