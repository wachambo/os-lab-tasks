#!/bin/bash

# Create some directories and files
mkdir Newdir
cd Newdir
for ((i = 1; i < 5; i++))
do
  dir=Newdir"$i"
  mkdir $dir
  cd $dir
  touch file"$i"
  cd ..
done

# Show recursive, by creation time, only first column: name
ls -Rt1 

# Show recursive verbose
cd ..
rm -rv Newdir
