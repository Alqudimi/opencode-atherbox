#!/usr/bin/env sh
set -eu
BASE_URL="${OPENCODE_V2_EXTENSIONS_BASE_URL:-https://raw.githubusercontent.com/Alqudimi/opencode-atherbox/main}"
TARGET="${XDG_CACHE_HOME:-${HOME}/.cache}/opencode-atherbox/opencode-v2-extensions"
mkdir -p "$(dirname "$TARGET")"
printf '%s\n' "Downloading OpenCode Atherbox..."
curl -fsSL "$BASE_URL/bin/opencode-v2-extensions" -o "$TARGET"
chmod 700 "$TARGET"
if [ "$#" -eq 0 ]; then
  exec "$TARGET" tui
fi
exec "$TARGET" "$@"
