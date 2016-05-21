#!/bin/bash

mypid=$$
export mypid
echo $mypid
sh second.sh
