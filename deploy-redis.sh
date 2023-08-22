#!/bin/bash

# Function to start Redis server
start_redis() {
  PORT="$1"
  CONFIG_FILE="${PORT}/redis.conf"
  SENTINEL_CONFIG="${PORT}/sentinel.conf"

  redis-server "$CONFIG_FILE" &
  pid=$!  # Get the PID of the background process
  pids+=($pid)  # Store the PID in the array
  echo "Redis instance on port ${PORT} has been started with PID $pid."

  redis-sentinel "$SENTINEL_CONFIG" &
  pid=$!  # Get the PID of the background process
  pids+=($pid)  # Store the PID in the array
  echo "Redis sentinal started on port ${PORT} has been started with PID $pid."
}

# Start Redis instances
start_redis 6379 
start_redis 6380 
start_redis 6381 

echo "created processes ${pids[@]}"

# Wait for user input to stop the Redis instances
echo "Press Enter to stop Redis instances..."
read

# Kill the background Redis instances
for pid in "${pids[@]}"; do
  kill "$pid"
done

echo "Redis instances have been stopped."