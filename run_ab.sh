#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

RESULTS_DIR="${RESULTS_DIR:-/tmp/results}"

sleep 10

/usr/bin/ab -n 90000 -c 50 ${NGINX_ENDPOINT} >"${RESULTS_DIR}/ab"
echo -n "${RESULTS_DIR}/ab" >"${RESULTS_DIR}/done"