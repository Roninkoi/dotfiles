mkdir /mnt/fedora
mount /dev/mapper/fedora_localhost--live-root /mnt/fedora
mount /dev/sda2 /mnt/fedora/boot
cd /mnt/fedora
mount -o bind /dev dev
mount -o bind /run run
mount -o bind /proc proc
mount -o bind /sys sys
mount -t tmpfs tmpfs tmp
chroot /mnt/fedora


