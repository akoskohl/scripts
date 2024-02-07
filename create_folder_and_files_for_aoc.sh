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

cat << EOF > day$dayNumber"-part1.js"
const fs = require('fs');

// inputFile = 'day$dayNumber-input.txt';
inputFile = 'day$dayNumber-test1.txt';

solution();

function solution() {
    input = readInputfile(inputFile);
   
    console.log(input);
}

function readInputfile (inputFile) {
    input = fs.readFileSync(inputFile, "utf-8").split("\n");
}
EOF
