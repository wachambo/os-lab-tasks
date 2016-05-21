#!/bin/bash

ls -R /bin >> bin.txt &
ls -R /dev >> dev.txt&
ls -R /lib >> lib.txt &jobs -l

kill -9 %3
jobs -l
