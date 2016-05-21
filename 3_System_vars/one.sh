#!/bin/bash

touch file_a
touch file_b
touch file_aa
touch file_aaa
touch file_c
touch file_d

num=$(ls -1 *[a] | wc -l) ; export num

ls -1
sh second.sh
