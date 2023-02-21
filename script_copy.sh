#!/bin/bash

WORKING_DIR=$(readlink -f "$(dirname "$0")")
TIMESTAMP=$(date +%F_%T)

sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"

RANDOMRW_SMALL_LOG=log_${USER}/randomrw_small_$TIMESTAMP.log
RANDOMRW_BIG_LOG=log_${USER}/randomrw_big_$TIMESTAMP.log

mkdir log_${USER}

touch $RANDOMRW_BIG_LOG
touch $RANDOMRW_SMALL_LOG

sudo filebench -f randomrw_small.f > $RANDOMRW_SMALL_LOG
sudo filebench -f randomrw_big.f > $RANDOMRW_BIG_LOG