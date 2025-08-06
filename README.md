# Linux Health Checker

[![CI](https://github.com/dennwats/linux-health-checker/actions/workflows/ci.yml/badge.svg)](https://github.com/dennwats/linux-health-checker/actions/workflows/ci.yml)

> **TL;DR**  
> One-command Linux health report for CPU, memory, disk, and uptime.  
> **Drafted with GitHub Copilot.**

## Quick Start

git clone https://github.com/dennwats/linux-health-checker.git
cd linux-health-checker
bash src/health-check.sh

-- Sample Output --

=== System Health Report ===
Timestamp : Tue Aug  5 10:11:35 PM EDT 2025
Hostname  : rhcsa
Uptime    : up 3 hours, 58 minutes

---- Memory ----
Mem:            16Gi       1.4Gi        14Gi        22Mi       922Mi        14Gi

---- Disk (/) ----
/dev/sda2        10G  5.1G  5.0G  51% /

---- CPU Load (1/5/15) ----
0.06 0.09 0.03
=== End Report ===

---- Network ----
Ping to 8.8.8.8 ✓
sshd service status : active

## New Features (v0.2)

- Color-coded output (yellow headers, green ✓, red ✗)
- Daily log written to `/tmp/health-YYYYMMDD.log`

