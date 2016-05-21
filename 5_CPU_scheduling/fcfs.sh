#!/bin/bash

echo "Enter Number of Processes:"
read nproc

echo "Enter Burst Time:"
for (( i=0; i<$nproc; i++ ))
do
  read burst[$i]
done


wait[0]=0
turnover[0]=${burst[0]}
avg_wait=0
avg_turnover=0
for (( i=1; i<$nproc; i++ ))
do
  wait[$i]=${turnover[$i-1]}
  turnover[$i]=$(( ${wait[$i]} + ${burst[$i]} ))
  avg_wait=$(( $avg_wait + ${wait[$i]} ))
  avg_turnover=$(( $avg_turnover + ${turnover[$i]} ))
done

avg_wait=$(( $avg_wait / $nproc ))
avg_turnover=$(( $avg_turnover / $nproc ))

echo "The Waiting time is ${wait[*]}"
echo "The Turnaround time is ${turnover[*]}"
echo "The Average waiting time is $avg_wait"
echo "The Average Turnaround time is $avg_turnover"
