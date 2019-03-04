#!/usr/bin/env python3

from bs4 import BeautifulSoup
import urllib.request
import requests
import sys

#target="http://www.cs.uah.edu/~rcoleman/CS307/TodaysClass/TodaysClass.html"
target=sys.argv[1]

#https://stackoverflow.com/questions/3969726/attributeerror-module-object-has-no-attribute-urlopen

#print("Target URL: ", target)
with urllib.request.urlopen(target) as url:
    s = url.read()


soup = BeautifulSoup(s,'html.parser') 


for img in soup.findAll('img'):
    imgsrc = img.get('src')
    print(imgsrc)
