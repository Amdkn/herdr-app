#!/usr/bin/env bash
# Smoke test de l'adapter A'Space pour herdr-app (contrat seul).
# Sous-commandes qui parlent seulement, binaire debug, maison scratch,
# télémétrie coupée (DO_NOT_TRACK=1, HERDR_TELEMETRY=0). Aucun envoi.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$HERE")"
BIN="$ROOT/target/debug/herdr-app"
[ -x "$BIN" ] || { echo "binaire absent : cargo test --locked d'abord"; exit 1; }
SCRATCH="$(mktemp -d)"
trap 'rm -rf "$SCRATCH"' EXIT
export HERDR_APP_HOME="$SCRATCH/home" DO_NOT_TRACK=1 HERDR_TELEMETRY=0
mkdir -p "$HERDR_APP_HOME"
"$BIN" --version | grep -q "herdr-app 0.1.14"
"$BIN" --help >/dev/null
"$BIN" --skill | grep -q "Herdr"
echo "smoke herdr-app OK (version 0.1.14, --help, --skill)"
