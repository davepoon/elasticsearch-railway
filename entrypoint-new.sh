#!/bin/bash
set -euo pipefail
sudo chown -R 1000 /esdata
exec /bin/tini -- /usr/local/bin/docker-entrypoint.sh eswrapper
