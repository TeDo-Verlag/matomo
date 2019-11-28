#!/bin/bash

if [ -z "$2" ]; then
    echo "No arguments supplied (input file, output file)"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Argument 1 must be a js file"
    exit 1
fi

# for git commit with date today
# GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"

sed '/<DEBUG>/,/<\/DEBUG>/d' < "$1" | sed 's/eval/replacedEvilString/' | java -jar yuicompressor-2.4.8.jar --type js -o "$2"
