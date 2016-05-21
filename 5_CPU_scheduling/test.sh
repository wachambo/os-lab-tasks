#!/bin/bash

i=0; j=1
burst[$i,$j]=5
burst[2,3]=90


echo ${burst[0]}
echo ${burst[2,3]}
((j++))
echo $j



# Bubble sort.
array=(3 6 1 9 4 2 0 12 5 5)
count=${#array[@]}

echo $count

exchange()
{
  temp=${array[$1]}
  array[$1]=${array[$2]}
  array[$2]=$temp
}

bubblesort()
{

arreglo=($@)
echo ${arreglo[*]}
echo ${arreglo[4]}

for (( last=count-1; last>0; last-- ))
do
  for (( i=0; i<$last; i++ ))
  do
    j=$(($i+1))
    if (( ${arreglo[$i]} > ${arreglo[$j]} ))
    then
      exchange $i $j
    fi
  done
done
}


echo ${array[*]}
bubblesort ${array[@]}
echo ${array[*]}
