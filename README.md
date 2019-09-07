# f3-docker
## Fight Flash Fraud Docker Container

Docker container bundled with [Fight Flash Fraud] (https://fight-flash-fraud.readthedocs.io). Even though Fight Flash Fraud (F3) was designed for testing USB flash drives and SD cards its design is perfect for testing Docker and Kubernetes Storage providers. 

## Parameters
Configuration is done using the following environment variables
### F3DATADIR
F3DATADIR defaults to /var/f3, and F3-Docker expects a mounted volume on F3DATADIR in order to store the data written by f3write and later verified by f3read.
### USER
Specifies the user to run. Defaults to root. Remember that the user needs to have write permissions to /var/f3
### DELAY
The time to wait after the execution completes (eg.: 3h waits for 3 hours). Uses bash sleep. Defaults to 30m
### OPERATION
There are 3 possible values for OPERATION:
#### ALL
Runs f3write and f3read in sequence
#### WRITE
Runs f3write and quits
#### READ
Runs f3read and quits (a previous run of f3write is expected)
