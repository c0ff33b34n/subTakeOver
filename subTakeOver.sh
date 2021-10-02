#!/bin/bash
#c0ff33b34n

echo "Target:"
read tar

if [ -f "domains" ] ; then
    rm domains
fi


subfinder -d $tar -all -o domains ;
assetfinder -subs-only $tar >> domains ;
amass enum -norecursive -noalts -d $tar >> domains ;

# add more subFinding methods for better results.

cat domains|grep $tar|sort -u > subdata.txt;
subjack -w subdata.txt -t 100 -timeout 30 -ssl -c ~/go/src/github.com/haccer/subjack/fingerprints.json -v 3 >> takeOver.txt ;

rm domains;
rm subdata.txt;

#bie
