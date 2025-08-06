#!/usr/bin/env bash
# System Health Checker  v0.1
# Usage: ./health-check.sh
set -euo pipefail
DATE=$(date)
trap 'echo "[${DATE}] ☠️  Script aborted"; exit 1' ERR

echo "=== System Health Report ==="
echo "Timestamp : $(date)"
echo "Hostname  : $(hostname)"
echo "Uptime    : $(uptime -p)"
echo
echo "---- Memory ----"
free -h | grep Mem
echo
echo "---- Disk (/) ----"
df -h / | tail -1
echo
echo "---- CPU Load (1/5/15) ----"
cut -d' ' -f1-3 /proc/loadavg
echo "=== End Report ==="
echo
echo "---- Network ----"
if ping -c1 -W1 8.8.8.8 >/dev/null 2>&1; then
  echo "Ping to 8.8.8.8 ✓"
else
  echo "Ping to 8.8.8.8 ✗"
fi
sshd_status=$(systemctl is-active sshd || true)
echo "sshd service status : $sshd_status"

