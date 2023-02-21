#!/bin/bash

## Variables
WORKING_DIR=$(readlink -f "$(dirname "$0")")
TIMESTAMP=$(date +%F_%T)

FILESERVER_LOG=log_${USER}/fileserver_$TIMESTAMP.log
OLTP_LOG=log_${USER}/oltp_$TIMESTAMP.log
WEBSERVER_LOG=log_${USER}/webserver_$TIMESTAMP.log
RANDOMRW_SMALL_LOG=log_${USER}/randomrw_small_$TIMESTAMP.log
RANDOMRW_BIG_LOG=log_${USER}/randomrw_big_$TIMESTAMP.log
RANDOMR_SMALL_LOG=log_${USER}/randomr_small_$TIMESTAMP.log
RANDOMR_BIG_LOG=log_${USER}/randomr_big_$TIMESTAMP.log

echo "Disabling stack randomization"
sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"

## Make folder
mkdir log_${USER}

echo "Running the benchmarks. Expect each one to take 10 mins. Will take ~1 hour in total :O"
echo "If you wanna shorten duration time, try editing the filebench configs (.f)"

## Run the benchmarks!
echo "Doing fileserver benchmark."
touch $FILESERVER_LOG
sudo filebench -f fileserver.f > $FILESERVER_LOG

echo "Doing fileserver benchmark."
touch $OLTP_LOG
sudo filebench -f oltp.f > $OLTP_LOG

echo "Doing webserver benchmark."
touch $WEBSERVER_LOG
sudo filebench -f webserver.f > $WEBSERVER_LOG

echo "Doing large random read writes."
touch $RANDOMRW_BIG_LOG
sudo filebench -f randomrw_big.f > $RANDOMRW_BIG_LOG

echo "Doing small random read writes."
touch $RANDOMRW_SMALL_LOG
sudo filebench -f randomrw_small.f > $RANDOMRW_SMALL_LOG

echo "Doing small random reads."
touch $RANDOMR_SMALL_LOG
sudo filebench -f randomread_small.f > $RANDOMR_SMALL_LOG

echo "Doing large random read reads."
touch $RANDOMR_BIG_LOG
sudo filebench -f randomread_big.f > $RANDOMR_BIG_LOG

echo "Benchmarking complete! To visualize, try out the python script :D"