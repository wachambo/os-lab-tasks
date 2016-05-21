#!/bin/bash

echo "Enter Number of Processes:"
read nproc

echo "Enter Burst Time:"
for (( i=0; i<$nproc; i++ ))
do
  read burst[$i]
done


# Sort processes by burst.

# Processes' order.
for (( i=0; i<$nproc; i++ ))
do
  order[$i]=$i
done

exchange()
{
  temp=${order[$1]}
  order[$1]=${order[$2]}
  order[$2]=$temp
}

bubblesort() 
{
  for (( last=$nproc-1; last>0; last-- ))
  do
    for (( i=0; i<$last; i++ ))
    do
      j=$(($i+1))

      # p & q indexes of the burst array
      p=${order[$i]}
      q=${order[$j]}

      if (( ${burst[$p]} > ${burst[$q]} ))
      then
        exchange $i $j
      fi
    done
  done
}

bubblesort


p=${order[0]}
wait[$p]=0
turnover[$p]=${burst[p]}
avg_wait=0
avg_turnover=0
for (( i=1; i<$nproc; i++ ))
do
  # p & q indexes of the burst array
  p=${order[$i]}
  q=${order[$i-1]}

  wait[$p]=${turnover[$q]}
  turnover[$p]=$(( ${wait[$p]} + ${burst[$p]} ))
  avg_wait=$(( $avg_wait + ${wait[$p]} ))
  avg_turnover=$(( $avg_turnover + ${turnover[$p]} ))
done

avg_wait=$(( $avg_wait / $nproc ))
avg_turnover=$(( $avg_turnover / $nproc ))

echo "The Waiting time is ${wait[*]}"
echo "The Turnaround time is ${turnover[*]}"
echo "The Average waiting time is $avg_wait"
echo "The Average Turnaround time is $avg_turnover"
