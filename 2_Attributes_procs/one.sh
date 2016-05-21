#!/bin/bash

mkdir Newdir1
cd Newdir1
for ((i = 1; i <= 5; i++))
do
  touch file."$i"
done

ls -l

cd ..
mkdir Newdir2
cd Newdir2
pwd
ln -s ../Newdir1/file.5 link
ls -l link

cd ..
rm Newdir1/file.5
ls -l Newdir2/link
