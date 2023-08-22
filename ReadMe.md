## Linux Based local redis configuration

# Requirements 
## This repository requires redis-server and redis-sentinel to be installed.

- Reconfigure the requirepass && masterauth
- Setup your own local dir and log output locations in the respective redis.conf or sentinel.conf files



# these commands search for any live redis-processes
$ ps aux | grep redis-server
$ ps aux | grep redis-sentinel