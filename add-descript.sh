#!/bin/bash

for i in ./debs/*.deb
do
   rm -fr ./debs/tmp
   pkg=`dpkg -f $i`
   pkg=`echo "$pkg" | grep "Package: " | cut -c 10- | tr -d "\n\r"`

   dpkg-deb -R $i ./debs/tmp

   echo "Depiction: https://nguyenthanh1995.github.io/description.html?goto=${pkg}" >> ./debs/tmp/DEBIAN/control
   echo "Homepage: https://nguyenthanh1995.github.io/" >> ./debs/tmp/DEBIAN/control

   dpkg -b ./debs/tmp

   bsname=$(basename "$i")
   mv ./debs/tmp.deb "./debs/$bsname"
done
exit 0