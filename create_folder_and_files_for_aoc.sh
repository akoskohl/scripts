#!/bin/bash

echo Day number?
read dayNumber

foldername=day$dayNumber

session=$(cat aoc_session.txt)

mkdir $foldername
cd $foldername

inputfile=day$dayNumber"-input.txt"
URL="https://adventofcode.com/2023/day/$dayNumber/input"

curl -b session=$session $URL > $inputfile

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

cat << EOF > day$dayNumber"-part1.py"
inputFile = "$inputfile";
# inputFile = day$dayNumber"-test1.txt"
input = []

def main():
    input = readInputfile(inputFile)    
    print(input)    

def readInputfile(inputFile):
    with open(inputFile, "r") as file:
        lines = file.readlines()
        content_list = [line.strip() for line in lines]
    return content_list

if __name__ == "__main__":
    main()
EOF

cat << EOF > day$dayNumber"-part2.js"
const fs = require('fs');

// inputFile = 'day$dayNumber-input.txt';
inputFile = 'day$dayNumber-test2.txt';

solution();

function solution() {
    input = readInputfile(inputFile);
   
    console.log(input);
}

function readInputfile (inputFile) {
    input = fs.readFileSync(inputFile, "utf-8").split("\n");
}
EOF

cat << EOF > day$dayNumber"-part2.py"
inputFile = "$inputfile";
# inputFile = day$dayNumber"-test2.txt"
input = []

def main():
    input = readInputfile(inputFile)    
    print(input)    

def readInputfile(inputFile):
    with open(inputFile, "r") as file:
        lines = file.readlines()
        content_list = [line.strip() for line in lines]
    return content_list

if __name__ == "__main__":
    main()
EOF

