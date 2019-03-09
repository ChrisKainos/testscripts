#!/bin/bash
# Simple line count example

# link filedescriptor 10 with stdin
exec 10<&0
exec < 10
in=$1

file="current_line.txt"
let count=0

While read LINE
do
((count++))
echo $LINE > $file
if [$? -ne 0 ]
then echo "Error in writing to file ${file}; check its permissions!"
fi
done

echo "Number of lines" $count"
echo "The last line of the file is 'cat ${file}'"

echo "expected nuber of lines: 'wc -l $in'"
exec 0<&10 10<&-
