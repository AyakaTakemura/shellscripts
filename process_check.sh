#!/bin/bash
#nginxのプロセスが起動している数を表示
echo "nginx process" | tr '\n' ' '
pgrep nginx |wc -l

SERVICES=`pgrep nginx |wc -l`

#nginxのプロセスが起動していない場合は起動させる
if [ "$SERVICES" -eq 0 ]; then
  echo "nginx is not running"
  systemctl start nginx

else
  echo "nginx is running"

fi
