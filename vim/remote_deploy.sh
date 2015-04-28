#!/bin/bash -e

REPO_DIR="$(mktemp -d -t 'yazevnul-dot-config.XXXXXXXXXX')"

cleanup() {
    rm -rf "${REPO_DIR}"
}

trap cleanup EXIT

git clone --quiet https://github.com/yazevnul/dot-config.git "${REPO_DIR}"
eval "${REPO_DIR}/vim/deploy.sh"
