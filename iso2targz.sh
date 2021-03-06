#!/usr/bin/env sh

ISO_PATH="./ImageBuilder/generic/openwrt-x86-generic-generic-image.iso"
INITRAMFS_PATH="./ImageBuilder/generic/openwrt-x86-generic-ramfs.bzImage"
KERNEL_PATH="./ImageBuilder/generic/openwrt-x86-generic-generic-kernel.bin"
OUTPUT_DIRECTORY="./WaltOpenwrtImage/"
OUTPUT_FILENAME="$OUTPUT_DIRECTORY/openwrt.tar.gz"

echo "Mouting the .iso file on /mnt/"
sudo mount $ISO_PATH /mnt/

echo "Creating the $OUTPUT_FILENAME archive"
tar zcvf $OUTPUT_FILENAME -C /mnt ./

echo "Unmounting the .iso file"
sudo umount /mnt/

echo "Moving the initramfs and kernel in place"
#cp $INITRAMFS_PATH $OUTPUT_DIRECTORY/vmlinuz
cp $KERNEL_PATH $OUTPUT_DIRECTORY/initrd.img
