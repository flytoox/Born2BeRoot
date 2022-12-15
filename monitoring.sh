#!/bin/bash
wall '#Architecture: '`uname -a`\
$'\n#CPU physical : '`nproc --all`\
$'\n#vCPU : '`cat /proc/cpuinfo | grep processor | wc -l`\
$'\n#Memory Usage: '`free | grep Mem | awk '{printf("%d/%dMB (%.2f%%)", $3 / 1024, $2 / 1024, $3 / $2 *100)}'`\
$'\n#Disk Usage: '`df --total -h | grep total | awk '{printf("%s/%s (%s)", $3, $2, $5)}'`\
$'\n#CPU load: '`mpstat | grep all | awk '{printf ("%.1f%%",100-$13)}'`\
$'\n#Last boot: '`who -b | awk '{printf("%s %s", $3, $4)}'`\
$'\n#LVM use: '`lsblk | grep lvm | wc -l | awk '{if($1) printf("yes")}'`\
$'\n#Connections TCP : '`netstat | grep tcp | grep ESTABLISHED | wc -l` 'ESTABLISHED'\
$'\n#User log: '`who | awk '{print $1}' | sort -u | wc -l`\
$'\n#Network: IP '`hostname -I ` '('`cat /sys/class/net/enp0s3/address`')'\
$'\n#Sudo : '`cat /var/log/sudo/sudo.log | grep -a COMMAND | wc -l` 'cmd'\
