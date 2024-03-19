#!/usr/bin/bash
if [ ! -d "/tmp/ramdisk" ]; then
  mkdir /tmp/ramdisk
  chmod 777 /tmp/ramdisk/
  mount -t tmpfs -o size=45G test /tmp/ramdisk
fi
if [ ! -f "/tmp/ramdisk/zero" ]; then
  dd if=/dev/zero of=/tmp/ramdisk/zero bs=4k count=10000000 
fi
fio read.fio > res-read.txt
fio write.fio > res-write.txt
#umount /tmp/ramdisk
#rm -rf /tmp/ramdisk
