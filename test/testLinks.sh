#!/bin/bash

# Test case 1: All URLs return HTTP 200
touch test-file1.txt
echo "https://www.yahoo.com
http://www.google.com" > test-file1.txt

output=$(../script.sh test-file1.txt)

if [ $? -ne 0 ]; then
  echo "Test case 1 failed: Script exited with an error"
  exit 1
fi

if [ ! -z "$output" ]; then
  echo "Test case 1 failed: Output should be empty"
  exit 1
fi

# Test case 2: One URL returns HTTP 404
touch test-file2.txt
echo "https://www.yahoo.com
http://www.thereisnotwaythispagecaneverexistforrreal.com" > test-file2.txt

output=$(../script.sh test-file2.txt)

if [ $? -ne 1 ]; then
  echo "Test case 2 failed: Script should exit with an error"
  exit 1
fi

# Test case 3: script accepts both files as params, and exists if a url returns HTTP 404
output=$(../script.sh test-file1.txt,test-file2.txt)

if [ $? -ne 1 ]; then
  echo "Test case 3 failed: Script should exit with an error"
  exit 1
fi

# Clean up test files
rm test-file1.txt
rm test-file2.txt

echo "All test cases passed!"