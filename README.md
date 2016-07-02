Install
=======

Firstly, you need to configure `install.sh` to be able to find you usb stick.

```shell
$ grub2-install --force --no-floppy --boot-directory=/mnt/USB/boot /dev/sdb
$ ./install.sh
```


References
==========

* https://github.com/aguslr/multibootusb
