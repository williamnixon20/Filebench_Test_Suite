#!/bin/bash

WORKING_DIR=$(readlink -f "$(dirname "$0")")
TIMESTAMP=$(date +%F_%T)

sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"

RANDOMR_SMALL_LOG=log_${USER}/randomr_small_$TIMESTAMP.log
RANDOMR_BIG_LOG=log_${USER}/randomr_big_$TIMESTAMP.log

mkdir log_${USER}

touch $RANDOMR_SMALL_LOG
touch $RANDOMR_BIG_LOG

sudo filebench -f randomread_big.f > $RANDOMR_BIG_LOG
sudo filebench -f randomread_small.f > $RANDOMR_SMALL_LOG