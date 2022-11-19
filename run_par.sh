#!/bin/bash

mkdir -p /weka/cli/fio-test/fio_result

for i in {001..025}
do
	ssh cli@lambda-hyperplane"$i" "/weka/cli/fio-test/fio.sh 2>&1 | tee /weka/cli/fio-test/fio_result/lambda-hyperplane"$i".txt" &
done
