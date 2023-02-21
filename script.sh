#!/bin/bash

WORKING_DIR=$(readlink -f "$(dirname "$0")")
TIMESTAMP=$(date +%F_%T)

sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"

FILESERVER_LOG=log_${USER}/fileserver_$TIMESTAMP.log
OLTP_LOG=log_${USER}/oltp_$TIMESTAMP.log
WEBSERVER_LOG=log_${USER}/webserver_$TIMESTAMP.log
RANDOMRW_SMALL_LOG=log_${USER}/randomrw_small_$TIMESTAMP.log
RANDOMRW_BIG_LOG=log_${USER}/randomrw_big_$TIMESTAMP.log
RANDOMR_SMALL_LOG=log_${USER}/randomr_small_$TIMESTAMP.log
RANDOMR_BIG_LOG=log_${USER}/randomr_big_$TIMESTAMP.log

mkdir log_${USER}

touch $FILESERVER_LOG
touch $OLTP_LOG
touch $WEBSERVER_LOG
touch $RANDOMRW_BIG_LOG
touch $RANDOMRW_SMALL_LOG
touch $RANDOMR_SMALL_LOG
touch $RANDOMR_BIG_LOG

sudo filebench -f oltp.f > $OLTP_LOG
sudo filebench -f webserver.f > $WEBSERVER_LOG
sudo filebench -f fileserver.f > $FILESERVER_LOG
sudo filebench -f randomrw_small.f > $RANDOMRW_SMALL_LOG
sudo filebench -f randomrw_big.f > $RANDOMRW_BIG_LOG
sudo filebench -f randomread_big.f > $RANDOMR_BIG_LOG
sudo filebench -f randomread_small.f > $RANDOMR_SMALL_LOG

echo "Benchmarking complete! To visualize, try out the python script :D"