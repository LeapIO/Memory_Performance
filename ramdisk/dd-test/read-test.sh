#!/usr/bin/bash
if [ ! -d "/tmp/ramdisk" ]; then
  mkdir /tmp/ramdisk
  chmod 777 /tmp/ramdisk/
  mount -t tmpfs -o size=45G test /tmp/ramdisk
fi
if [ ! -f "/tmp/ramdisk/zero" ]; then
  dd if=/dev/zero of=/tmp/ramdisk/zero bs=4k count=10000000 
fi
for ((i=0;i<10;i++)); do
  dd if=/tmp/ramdisk/zero of=/dev/null bs=4k count=10000000
  sleep 5
done
#umount /tmp/ramdisk
#rm -rf /tmp/ramdisk
