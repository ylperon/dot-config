#!/bin/bash
set -e

REPO_DIR="$(mktemp -d -t 'yazevnul-dot-config.XXXXXXXXXX')"

git clone --quiet https://github.com/yazevnul/dot-config.git "${REPO_DIR}"
"${REPO_DIR}/deploy.sh"
rm -rf "$REPO_DIR"
