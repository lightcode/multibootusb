#!/bin/bash

set -ex

DEVICE=/dev/sdb1
MOUNTPOINT=/mnt/USB

mount "$DEVICE" "$MOUNTPOINT"

mkdir -p "${MOUNTPOINT}/targets"

cp -v -f ./grub.cfg "${MOUNTPOINT}/boot/grub2/grub.cfg"

cp -v -u ./targets/* "${MOUNTPOINT}/targets"

umount "$DEVICE"
