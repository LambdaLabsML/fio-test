#!/bin/sh
#TEST_SIZE=${1:-"64m"}
#TEST_DIR=${2:-"/weka/cli/fio-test/fio_data/$HOSTNAME"}

TEST_SIZE=2048G
RUNTIME=1800s
TEST_DIR="/weka/cli/fio-test/fio_data/$HOSTNAME"

echo $TEST_SIZE
echo $TEST_DIR

mkdir -p $TEST_DIR

date
fio --name=write_throughput --directory=$TEST_DIR --numjobs=8  --size=$TEST_SIZE --time_based --runtime=$RUNTIME --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=write --group_reporting=1
date
fio --name=write_iops --directory=$TEST_DIR --size=$TEST_SIZE --time_based --runtime=$RUNTIME --ramp_time=2s --ioengine=libaio --direct=1  --verify=0 --bs=4K --iodepth=64 --rw=randwrite --group_reporting=1
date
fio --name=read_throughput --directory=$TEST_DIR --numjobs=8  --size=$TEST_SIZE --time_based --runtime=$RUNTIME --ramp_time=2s --ioengine=libaio  --direct=1 --verify=0 --bs=1M --iodepth=64 --rw=read --group_reporting=1
date
fio --name=read_iops --directory=$TEST_DIR --size=$TEST_SIZE --time_based --runtime=$RUNTIME --ramp_time=2s --ioengine=libaio --direct=1 --verify=0 --bs=4K --iodepth=64 --rw=randread --group_reporting=1
date
