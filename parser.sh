#!/bin/bash

taskN() {
   TODAY=$(date +"%Y%m%d%H%M%S")
   mkdir -p "st/${1}/${2}"
      t=$(date +"%H%M")
      if [[ $t -gt 1920 && $t -lt 2000 ]];then
         echo "start taskN ${2}\n";
         ./gowitness single --destination "st/${1}/${2}" --disable-db -u ${3}
         for x in "st/${1}/${2}/https*.png"; do
            mv  $x "st/${1}/${2}/${TODAY}.png"
         done
         echo "end taskN ${2}\n";
      else 
         echo "pass taskN ${2}\n";
      fi
      sleep 5
}
day=$(date +"%u")
mkdir -p "st/${day}"

if [ $day -eq 1 ];then
   #河內
   CODE="XSMB"
   URL="https://www.minhngoc.net.vn/kqxs/mien-bac.html";
   taskN ${day} ${CODE} ${URL}
fi
