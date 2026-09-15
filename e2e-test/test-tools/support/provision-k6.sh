#!/bin/bash
# k6 is a *guest tool*: the AutoBDD image ships the framework and nothing beyond it, so a
# project provisions the extra tooling its features need. This installs k6 into the project
# user's ~/.local/bin — pinned version, checksum-verified — and is a no-op when the image
# already provides k6 or it is already installed.
#
#   ./provision-k6.sh && ~/.local/bin/k6 run k6-test/performance-test.js
set -euo pipefail

K6_VERSION="${K6_VERSION:-v2.2.0}"
K6_SHA256="${K6_SHA256:-b5a8003c86f35f5cd5ceef1490312c48e587696c94d998cefc6d7b3b4cb1597d}"
K6_BIN="${HOME}/.local/bin/k6"

mkdir -p "$(dirname "${K6_BIN}")"

# already provisioned (or provided by the image via PATH)
if [ -x "${K6_BIN}" ]; then
    exit 0
fi
if command -v k6 >/dev/null 2>&1; then
    ln -sf "$(command -v k6)" "${K6_BIN}"
    exit 0
fi

echo "installing k6 ${K6_VERSION} into ${K6_BIN}" >&2
mkdir -p /tmp/k6-dl
curl -fsSL -o /tmp/k6-dl/k6.tar.gz \
    "https://github.com/grafana/k6/releases/download/${K6_VERSION}/k6-${K6_VERSION}-linux-amd64.tar.gz"
echo "${K6_SHA256}  /tmp/k6-dl/k6.tar.gz" | sha256sum -c -
tar xzf /tmp/k6-dl/k6.tar.gz -C /tmp/k6-dl
install -m 0755 "/tmp/k6-dl/k6-${K6_VERSION}-linux-amd64/k6" "${K6_BIN}"
