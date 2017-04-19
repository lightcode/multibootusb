#!/bin/bash

set -e

DEVICE=/dev/sdb1
MOUNTPOINT=/mnt/usb

mkdir -p "${MOUNTPOINT}"

mount "${DEVICE}" "${MOUNTPOINT}"

mkdir -p "${MOUNTPOINT}/targets"

cp -v -f ./grub.cfg "${MOUNTPOINT}/boot/grub/grub.cfg"

pushd "${MOUNTPOINT}/targets"

while read url; do
  if [ ! -e $(basename "$url") ]; then
    curl -LO --progress-bar "${url}"
  else
    echo "Skip ${url}: file already exists"
  fi
done < <(sed -n '/^# SOURCE: / s/# SOURCE: // p' "${MOUNTPOINT}/boot/grub/grub.cfg")
popd

umount "$DEVICE"
