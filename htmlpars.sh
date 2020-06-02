#!/bin/bash

# Script by Vszn

# HTML Parsing

if [ "$1" == "" ]
then
 echo "Você não colocou um endereço(DNS)."
 echo "$0 www.siteparascanear.com.br"
else
 wget -q $1
 grep href index.html | cut -d "/" -f3 | grep "\." | cut -d '"' -f1 | sort -u > hrefs
 for url in $(cat hrefs);
do
 host $url | grep "has address";
done
 rm hrefs
 rm index.html
fi 
