#!/bin/bash

# Function to clear logs in local directory
clear_logs() {
  PORT="$1"
  rm "${PORT}/redis.log"
  rm "${PORT}/sentinel.log"
  rm "${PORT}/dump.rdb"
  rm -rf "${PORT}/appendonlydir"
  echo "Redis logs cleared."
}

# Start Redis instances
clear_logs 6379 
clear_logs 6380 
clear_logs 6381 

