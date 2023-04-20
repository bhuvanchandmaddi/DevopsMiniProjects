#!/bin/bash

# Get the third most CPU consuming process and its properties
cpu_process=$(ps aux --sort=-%cpu | awk 'NR==4 {print $11,$3,$4,$2}')
cpu_pid=$(echo $cpu_process | awk '{print $NF}')
cpu_port=$(lsof -Pan -p $cpu_pid -i | awk '{if($1=="LISTEN"){print $9}}' | awk -F':' '{print $NF}')

# Get the third most memory consuming process and its properties
mem_process=$(ps aux --sort=-%mem | awk 'NR==4 {print $11,$3,$4,$2}')
mem_pid=$(echo $mem_process | awk '{print $NF}')
mem_port=$(lsof -Pan -p $mem_pid -i | awk '{if($1=="LISTEN"){print $9}}' | awk -F':' '{print $NF}')

# Output the process information to a file
echo "Process Name,% CPU used,% Memory used,PORT,PID" > process_info.txt
echo "$cpu_process,$cpu_port" >> process_info.txt
echo "$mem_process,$mem_port" >> process_info.txt
