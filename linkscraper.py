#!/usr/bin/env python3

from bs4 import BeautifulSoup
import urllib.request
import requests


target="http://www.cs.uah.edu/~rcoleman/CS307/TodaysClass/TodaysClass.html"


#https://stackoverflow.com/questions/3969726/attributeerror-module-object-has-no-attribute-urlopen
with urllib.request.urlopen(target) as url:
    s = url.read()


soup = BeautifulSoup(s,'html.parser') 

images = []

for img in soup.findAll('img'):
    imgsrc = img.get('src')
    #images.append(img.get('src'))
    print(imgsrc)
#print(images)
