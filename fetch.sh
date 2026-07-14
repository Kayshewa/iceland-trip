#!/bin/bash
# Fetch freely-licensed lead images from Wikipedia, downscale, base64 -> imgs/<key>.txt
cd "$(dirname "$0")"
mkdir -p imgs raw

UA="IcelandTripPlanner/1.0 (personal trip itinerary; contact tripiandkayshewa@gmail.com)"

fetch() {
  key="$1"; title="$2"
  url=$(curl -s -A "$UA" "https://en.wikipedia.org/api/rest_v1/page/summary/$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$title")" | jq -r '.thumbnail.source // empty')
  if [ -z "$url" ]; then echo "MISS  $key ($title)"; sleep 0.2; return; fi
  # extract the Commons filename (component before /NNNpx-) and fetch a 760px render
  fname=$(echo "$url" | sed -E 's#.*/thumb/[^/]+/[^/]+/([^/]+)/.*#\1#')
  big="https://commons.wikimedia.org/wiki/Special:FilePath/${fname}?width=760"
  curl -s -L -A "$UA" "$big" -o "raw/$key.img"
  sleep 0.2
  if [ ! -s "raw/$key.img" ]; then echo "DLFAIL $key"; return; fi
  sips -s format jpeg -Z 600 -s formatOptions 68 "raw/$key.img" --out "raw/$key.jpg" >/dev/null 2>&1
  if [ ! -s "raw/$key.jpg" ]; then echo "SIPSFAIL $key"; return; fi
  printf 'data:image/jpeg;base64,' > "imgs/$key.txt"
  base64 -i "raw/$key.jpg" | tr -d '\n' >> "imgs/$key.txt"
  sz=$(wc -c < "imgs/$key.txt")
  echo "OK    $key  ${sz}b"
}

while IFS='|' read -r k t; do
  [ -z "$k" ] && continue
  fetch "$k" "$t"
done <<'EOF'
thingvellir|Þingvellir
oxararfoss|Öxarárfoss
bruarfoss|Brúarfoss
geysir|Strokkur
gullfoss|Gullfoss
kerid|Kerið
faxi|Faxi (waterfall)
fridheimar|Friðheimar
secretlagoon|Secret Lagoon
seljalandsfoss|Seljalandsfoss
gljufrabui|Gljúfrabúi
skogafoss|Skógafoss
solheimajokull|Sólheimajökull
planewreck|Sólheimasandur
dyrholaey|Dyrhólaey
puffin|Atlantic puffin
reynisfjara|Reynisdrangar
vik|Vík í Mýrdal
fjadrargljufur|Fjaðrárgljúfur
mulagljufur|Múlagljúfur
jokulsarlon|Jökulsárlón
diamondbeach|Breiðamerkursandur
vestrahorn|Vestrahorn
hofn|Höfn
hallgrimskirkja|Hallgrímskirkja
harpa|Harpa (concert hall)
sunvoyager|Sun Voyager
reykjavik|Reykjavík
hotdog|Icelandic hot dog
langoustine|Nephrops norvegicus
tomatosoup|Tomato soup
icecream|Ice cream
pho|Phở
kjotsupa|Kjötsúpa
keflavik|Keflavík
EOF
echo "=== done ==="
