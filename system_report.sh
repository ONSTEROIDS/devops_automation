#!/bin/bash
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
UPTIME=$(uptime -p)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
MEM=$(free | awk '/Mem:/ {printf("%.2f%%", $3/$2 * 100)}')
DISK=$(df -h / | awk 'NR==2 {print $5}')
TOP3=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4 | tail -n 3)

{
echo "-----"
echo "Timestamp: $TIMESTAMP"
echo "Uptime: $UPTIME"
echo "CPU Usage: $CPU"
echo "Memory Usage: $MEM"
echo "Disk Usage: $DISK"
echo "Top 3 Processes:"
echo "$TOP3"
echo ""
} >> /var/log/system_report.log
