#!/bin/bash


baseURL="http://www.cs.uah.edu/~rcoleman/"


extra="/TodaysClass/"

pyextra="/TodaysClass/TodaysClass.html"

PS3='Enter your choice of class >> '

options=("CS221" "CS307" "CS499")
select opt in "${options[@]}"
do
  case $opt in
    "CS221")
      echo "CS221 chosen" 
      class='CS221'
      break
      ;;
    "CS307")
      echo "CS307 chosen"
      class='CS307'
      break
      ;;
    "CS499")
      echo "CS499 chosen" 
      class='CS499'
      break
      ;;
  esac
done

echo $class  chosen class

pyURL=$baseURL$class$pyextra

echo python url passed: $pyURL

python3 linkscraper.py $pyURL > links

#UNCOMMENT TO AVOID DOWNLOADING FILES
#exit 0

n=1
cd $class
while read line; do
  fullURL=$baseURL$class$extra$line
  wget "$fullURL" 
  echo $fullURL
  n=$((n+1))
done < ../links

#Rename files to eliminate spaces
find -name "* *" -type f | rename 's/ /_/g'

convert $(ls *.jpg) $class.`date +%m-%d`.slides.pdf

#rm links
#rm *.jpg
