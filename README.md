# arch-linux-stuff

A small summary:

1. If needed, load your keymap
2. Refresh the servers with pacman -Syy
3. Partition the disk
4. Format the partitions
5. Mount the partitions
6. Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git nano amd-ucode (or amd-ucode))
7. Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/FSTAB
8. Chroot in with arch-chroot /mnt
9. Download the git repository with git clone https://github.com/rusthic/arch-linux-stuff
10. cd arch-linux-stuff
11. chmod +x install-uefi.sh
12. run with ./install-uefi.sh
