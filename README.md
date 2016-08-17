Install
=======

You need to create a bootable usb stick. If you want create partition, you can use `parted` but beware, replace `/dev/sdb` by your device.

With `parted`, we create a bootable device:

```shell
$ sudo parted /dev/sdb
(parted) unit mib
(parted) mklabel msdos
(parted) mkpart primary 3 -1
(parted) set 1 boot on                                                    
(parted) p                                                                
Model: Generic Flash Disk (scsi)
Disk /dev/sdb: 3850MiB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags: 

Number  Start    End      Size     Type     File system  Flags
 1      3.00MiB  3849MiB  3846MiB  primary               boot, lba
```

Next, you have to format the partition, I prefer to use FAT32 but this also work with EXT:

```shell
$ sudo mkfs.vfat -F 32 /dev/sdb1
```

Now, you can install grub on your device:

```shell
$ sudo mkdir -p /mnt/usb
$ sudo mount /dev/sdb1 /mnt/usb
$ sudo grub-install --force --no-floppy --boot-directory=/mnt/usb/boot /dev/sdb
```

Finally, you can run the script to setup images (you may have to edit the script if you don't use the same paths as me):

```shell
$ ./install.sh
```

And that's it. You can now boot on your usb stick!


References
==========

* https://github.com/aguslr/multibootusb
