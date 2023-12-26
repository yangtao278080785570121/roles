#!/bin/bash
HOST="localhost"
PORT="80"
 
# 检测nginx进程是否存在
ping() {
    /usr/sbin/pidof nginx | wc -l
}
 
# 检测nginx性能
active() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| grep 'Active' | awk '{print $NF}'
}
 
reading() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| grep 'Reading' | awk '{print $2}'
}
 
writing() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| grep 'Writing' | awk '{print $4}'
}
 
waiting() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| grep 'Waiting' | awk '{print $6}'
}
 
accepts() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| awk NR==3 | awk '{print $1}'
}
 
handled() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| awk NR==3 | awk '{print $2}'
}
 
requests() {
    /usr/bin/curl "http://$HOST:$PORT/status/" 2>/dev/null| awk NR==3 | awk '{print $3}'
}
 
# 执行function
$1

