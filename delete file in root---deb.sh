#!/bin/bash

for i in ./debs/*.deb
do

   dpkg-deb -R $i ./debs/tmp

   rm ./debs/tmp/*.deb

   dpkg -b ./debs/tmp

   bsname=$(basename "$i")
   mv ./debs/tmp.deb "./debs/$bsname"

   rm -rf ./debs/tmp

done
exit 0