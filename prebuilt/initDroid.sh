#!/sbin/bash

export PATH=/bin:/sbin:/system/sbin:/system/bin:/usr/sbin/
export LD_LIBRARY_PATH=/system/lib

[ -e /dev/console ] || /sbin/busybox mknod /dev/console c 5 1 

[ -e /host ] || /sbin/busybox mkdir /host

/sbin/busybox mknod /dev/loop0 b 7 0 &> /dev/console
/sbin/busybox mknod /dev/loop1 b 7 1 &> /dev/console
/sbin/busybox mknod /dev/loop2 b 7 2 &> /dev/console
/sbin/busybox mknod /dev/nand0p2 b 254 2 &> /dev/console

/sbin/fsck.hfs -q /dev/nand0p2 &> /dev/console
if [ $? != 0 ]
then
	/sbin/fsck.hfs /dev/nand0p2 &> /dev/console
fi

/sbin/busybox mount -n -o noatime /dev/nand0p2 /host &> /dev/console
/sbin/busybox chmod a+rx /host &> /dev/console

/sbin/busybox losetup /dev/loop0 /host/idroid/system.img &> /dev/console
/sbin/busybox losetup /dev/loop1 /host/idroid/userdata.img &> /dev/console
/sbin/busybox losetup /dev/loop2 /host/idroid/cache.img &> /dev/console

/sbin/fsck.ext -p /dev/loop0 &> /dev/console
/sbin/fsck.ext -p /dev/loop1 &> /dev/console
/sbin/fsck.ext -p /dev/loop2 &> /dev/console

/sbin/busybox mount -o noatime /dev/loop0 /system &> /dev/console
/sbin/busybox mount -o noatime,nosuid,nodev /dev/loop1 /data &> /dev/console
/sbin/busybox mount -o noatime,nosuid,nodev /dev/loop2 /cache &> /dev/console
/sbin/busybox mount -o remount,noatime,ro /dev/loop0 /system &> /dev/console

if [ -f /host/root/Library/Lockdown/activation_records/wildcard_record.plist ]
then
/bin/cat /host/root/Library/Lockdown/activation_records/wildcard_record.plist > /data/wildcard_record.plist
fi

exit 0
