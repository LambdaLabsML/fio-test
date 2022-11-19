#!/bin/bash


for i in {001..025};
do
	ssh root@lambda-hyperplane"$i" "sudo pkill fio"
done
