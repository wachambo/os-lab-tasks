#!/bin/bash

mkdir Dir1 Dir2
cd Dir1
touch file_a
touch file_b
touch file_c
touch file_d.txt
touch file_e.txt
cd ..

echo "files and folders in alphabetical order"
ls -1 Dir1 Dir2 # One column
mv Dir1/*.txt Dir2
echo "files and folders in reverse alphabetical order"
ls -1r Dir1 Dir2 # One column reverse
