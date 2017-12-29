#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

RESULTS_DIR="${RESULTS_DIR:-/tmp/results}"

sleep 10

/usr/bin/ab -n 90000 -c 50 ${NGINX_ENDPOINT} >"${RESULTS_DIR}/ab"

echo "ab done"

cd ${RESULTS_DIR}
tar -czf e2e-ab.tar.gz *
# mark the done file as a termination notice.
echo -n ${RESULTS_DIR}/e2e-ab.tar.gz > ${RESULTS_DIR}/done