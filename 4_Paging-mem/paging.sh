#!/bin/bash

logic_size=64 # Logical Mem Size.
phy_size=128  # Physical Mem Size.
page_size=8   # Enter Page Size.

echo "Enter Number of Processes: "
read nproc

echo "Enter Size of Processes: "
for (( i=0; i<$nproc; i++ ))
do
  read proc_size[$i]
done

echo "Number of Pages of Logical Mem: "
npages=$(( $logic_size / $page_size ))
echo $npages

echo "Number of Frames of Physical Mem: "
nframes=$(( $phy_size / $page_size ))
echo $nframes

echo "Num Pages occupied by each Process: "
for (( i=0; i<$nproc; i++ ))
do
  if (( ${proc_size[$i]} > $page_size ))
  then
    npages_proc[$i]=$(( ${proc_size[$i]} / $page_size ))
  else
    npages_proc[$i]=1
  fi
done
echo ${npages_proc[*]}


# Physical Mem (0->free / otherwise(num of proc)->occupied)
# Set Physical Mem free.
for (( i=0; i<$nframes; i++ ))
do
  phy[$i]='x'
done


# Mapping Pages to Physical Mem.
# Pages Tables: array[num_pages]
j=0
for (( p=0; p<$nproc; p++ ))
do
  for (( i=0; i<${npages_proc[$p]}; i++ ))
  do
    if (( ${phy[$j]} == 'x' )) 
    then
      (( page_table$p[$i]=$j ))	#equivalent to let expression
      phy[$j]=$p
    fi
    j=$(($j+1))
  done
done


# Physical Mem occupation (0->free / num of proc->occupied)
echo "Physical Mem: ${phy[*]}"
