#!/bin/bash

WORKING_DIR=$(readlink -f "$(dirname "$0")")
TIMESTAMP=$(date +%F_%T)

sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"

FILESERVER_LOG=log_${USER}/fileserver_$TIMESTAMP.log
OLTP_LOG=log_${USER}/oltp_$TIMESTAMP.log
WEBSERVER_LOG=log_${USER}/webserver_$TIMESTAMP.log

rm -rf $WORKING_DIR/log_${USER}

mkdir log_${USER}

touch $FILESERVER_LOG
touch $OLTP_LOG
touch $WEBSERVER_LOG

sudo filebench -f oltp.f > $OLTP_LOG
sudo filebench -f webserver.f > $WEBSERVER_LOG
sudo filebench -f fileserver.f > $FILESERVER_LOG