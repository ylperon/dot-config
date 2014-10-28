#!/bin/bash
set -e

REPO_DIR="$(mktemp -d -t 'yazevnul-dot-config.XXXXXXXXXX')"

git clone --quiet https://github.com/yazevnul/dot-config.git "${REPO_DIR}"
eval "${REPO_DIR}/vim/deploy.sh"
rm -rf "${REPO_DIR}"
