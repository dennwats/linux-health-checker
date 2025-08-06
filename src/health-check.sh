#!/usr/bin/env bash
# System Health Checker  v0.1
# Usage: ./health-check.sh
set -euo pipefail
DATE=$(date)
trap 'echo "[${DATE}] ☠️  Script aborted"; exit 1' ERR
# --- Color helpers ------------------------------
RED="\e[31m"; GRN="\e[32m"; YLW="\e[33m"; NRM="\e[0m"

LOG=/tmp/health-$(date +%Y%m%d).log
exec > >(tee -a "$LOG") 2>&1

echo "=== System Health Report ==="
echo "Timestamp : $(date)"
echo "Hostname  : $(hostname)"
echo "Uptime    : $(uptime -p)"
echo
echo -e "${YLW}---- Memory ----${NRM}"

free -h | grep Mem
echo
echo -e "${YLW}---- Disk ----${NRM}"
df -h / | tail -1
echo
echo -e "${YLW}---- CPU Load (1/5/15) ----${NRM}"

cut -d' ' -f1-3 /proc/loadavg
echo -e "${YLW}== End Report ===${NRM}"
echo
echo -e "${YLW}---- Network ----${NRM}"
if ping -c1 -W1 8.8.8.8 >/dev/null 2>&1; then
  echo "Ping to 8.8.8.8 ✓"
else
  echo "Ping to 8.8.8.8 ✗"
fi
sshd_status=$(systemctl is-active sshd || true)
echo "sshd service status : $sshd_status"


