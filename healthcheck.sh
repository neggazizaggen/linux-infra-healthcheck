#!/usr/bin/env bash
# Project: linux-infra-healthcheck
# Author: Sobhy (replace with your preferred public name/handle)
# Purpose: Read-only baseline checks for a Linux lab system.
# Safety: Does not change system configuration.

set -u

echo "======================================"
echo " Linux Infrastructure Health Check"
echo "======================================"
echo "Date          : $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "Host          : $(hostname)"
echo "OS            : $(. /etc/os-release 2>/dev/null; printf '%s' "${PRETTY_NAME:-Unknown}")"
echo "Kernel        : $(uname -r)"
echo "Uptime        : $(uptime -p 2>/dev/null || uptime)"
echo

echo "--- Filesystem usage ---"
df -h -x tmpfs -x devtmpfs
echo

echo "--- Memory ---"
if command -v free >/dev/null 2>&1; then
    free -h
else
    echo "Command 'free' not found; skipping memory details."
fi
echo

echo "--- Failed systemd services ---"
if command -v systemctl >/dev/null 2>&1; then
    systemctl --failed --no-pager 2>/dev/null || \
        echo "Could not query systemd services in this environment."
else
    echo "systemctl not available; skipping service check."
fi

echo
echo "Health check completed. Review the output; this script does not diagnose every issue."
