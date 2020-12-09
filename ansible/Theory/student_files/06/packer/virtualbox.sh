VIRT=`dmesg | grep "Hypervisor detected" | awk -F': ' '{print $2}'`
[[ $VIRT == "Microsoft HyperV" ]] && exit 0
yum -y install dkms dbus dbus-libs

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
echo "VBOX_VERSION: ${VBOX_VERSION}"

VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
echo "VBOX_ISO: ${VBOX_ISO}"

mount -ov loop $VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount -v /mnt

#Cleanup VirtualBox
rm -vf $VBOX_ISO
