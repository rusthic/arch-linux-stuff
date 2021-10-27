#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr networkmanager network-manager-applet dialog mtools dosfstools reflector base-devel linux-headers xdg-user-dirs xdg-utils gvfs gvfs-smb gvfs-mtp inetutils alsa-utils pipewire pipewire-alsa pipewire-pulse bash-completion reflector flatpak os-prober ntfs-3g

pacman -S --noconfirm xf86-video-amdgpu mesa vulkan-radeon  libva-mesa-driver  mesa-vdpau lib32-mesa lib32-vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vdpau

#grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
#grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable fstrim.timer

useradd -m rusthic
echo rusthic:password | chpasswd
usermod -aG rusthic

echo "rusthic ALL=(ALL) ALL" >> /etc/sudoers.d/rusthic


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




