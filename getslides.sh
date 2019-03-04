#!/bin/bash




python3 linkscraper.py > links

baseURL="http://www.cs.uah.edu/~rcoleman/CS307/TodaysClass/"

n=1
while read line; do
  fullURL=$baseURL$line
  curl --silent -O $fullURL
  #echo $fullURL
  #n=$((n+1))
done < links


convert $(ls *.jpg) slides.pdf 2>/dev/null

rm links
rm *.jpg
