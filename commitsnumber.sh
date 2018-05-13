#!/bin/bash
files=$(git ls-files | grep "\.java" | grep -v "target/generated-sources" | grep -v "test")
for file in $files; do
	changes=$(git log --oneline -- $file | wc -l)
	echo "$file, $changes"
done
