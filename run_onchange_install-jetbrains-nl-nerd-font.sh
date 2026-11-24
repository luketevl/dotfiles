#!/usr/bin/env bash
# Instala a JetBrainsMonoNL Nerd Font Mono (usada no kitty) na pasta de fontes do usuario.
# Nao usa pacote do sistema: no Omarchy, ttf-jetbrains-mono-nerd conflita com o
# ttf-jetbrains-mono-nerd-basic, do qual o pacote omarchy depende.
set -euo pipefail

VERSION="v3.5.1"
FAMILY="JetBrainsMonoNL Nerd Font Mono"
DEST="$HOME/.local/share/fonts/JetBrainsMonoNLNerdFontMono"

if fc-list : family | grep -F "$FAMILY" >/dev/null; then
  exit 0
fi

echo "Instalando $FAMILY ($VERSION)..."
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

curl -fsSL -o "$tmp/JetBrainsMono.tar.xz" \
  "https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/JetBrainsMono.tar.xz"
mkdir -p "$tmp/x" "$DEST"
tar -xJf "$tmp/JetBrainsMono.tar.xz" -C "$tmp/x"
cp "$tmp"/x/JetBrainsMonoNLNerdFontMono-*.ttf "$DEST/"
fc-cache -f "$DEST"
