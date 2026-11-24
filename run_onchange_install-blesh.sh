#!/usr/bin/env bash
# Instala o ble.sh (sugestoes do historico em cinza e realce de sintaxe no bash)
# na pasta do usuario, sem sudo. Atualizar depois: ble-update
set -euo pipefail

DEST="$HOME/.local/share/blesh"

if [[ -f $DEST/ble.sh ]]; then
  exit 0
fi

echo "Instalando ble.sh (nightly) em $DEST..."
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fsSL -o "$tmp/ble.tar.xz" \
  "https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz"
tar -xJf "$tmp/ble.tar.xz" -C "$tmp"
mkdir -p "$(dirname "$DEST")"
rm -rf "$DEST"
mv "$tmp"/ble-nightly* "$DEST"
