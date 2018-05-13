#!/bin/bash
files=$(git ls-files | grep "\.java" | grep -v "target/generated-sources" | grep -v "test")
for file in $files; do
	authors=$(git log --pretty=format:"%an%x09" "$file" | sort | uniq | grep -v "Jenkins" | wc -l)
	changes=$(git log --oneline -- $file | wc -l)
	last_modified=$(git log -1 --format="%ai" -- "$file")
	echo "$file, $last_modified, $authors, $changes"
done
