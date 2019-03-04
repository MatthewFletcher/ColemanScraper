#!/bin/bash


baseURL="http://www.cs.uah.edu/~rcoleman/"


extra="/TodaysClass/"

pyextra="/TodaysClass/TodaysClass.html"

PS3='Enter your choice of class >> '

options=("CS221" "CS307")
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
  esac
done

class="CS307"

pyURL=$baseURL$class$pyextra

echo python url passed: $pyURL

python3 linkscraper.py $pyURL > links

#UNCOMMENT TO AVOID DOWNLOADING FILES
#exit 0

n=1
while read line; do
  fullURL=$baseURL$class$extra$line
  curl --silent -O $fullURL
  #echo $fullURL
  #n=$((n+1))
done < links


convert $(ls *.jpg) slides.pdf 2>/dev/null

rm links
rm *.jpg
