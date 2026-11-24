#!/usr/bin/env bash
# Docker rootless: o daemon roda como o usuario, sem sudo e sem o grupo docker
# (que equivale a root sem senha). Precisa do pacote AUR docker-rootless-extras:
#   yay -S docker-rootless-extras
# Usa um docker context (vale para qualquer programa, nao so para o bash).
set -euo pipefail

command -v dockerd-rootless.sh >/dev/null || exit 0
command -v docker >/dev/null || exit 0

systemctl --user enable --now docker.socket docker.service

sock="unix://${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/docker.sock"
if ! docker context inspect rootless >/dev/null 2>&1; then
  docker context create rootless --description "Docker rootless do usuario" --docker "host=$sock"
fi
docker context use rootless >/dev/null
