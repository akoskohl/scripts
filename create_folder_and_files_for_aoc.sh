#!/bin/bash

echo Day number?
read dayNumber

foldername=day$dayNumber

mkdir $foldername
cd $foldername

inputfile=day$dayNumber"-input.txt"

touch day$dayNumber"-test1.txt"
touch day$dayNumber"-test2.txt"
touch $inputfile

