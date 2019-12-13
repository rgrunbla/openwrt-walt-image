FROM scratch

# specify which node models this image can handle
# step B.1
LABEL walt.node.models=pc-x86-64

ENTRYPOINT ["/bin/ash"]

ADD ./openwrt.tar.gz /

RUN ls /

RUN mkdir /var/lock/

# step B.2 for ipxe
COPY boot/ /boot

# Install image spec file
COPY image.spec /etc/walt/

# Copy kernel
RUN cp /boot/vmlinuz /

# Allow passwordless root login on the serial console
RUN sed -i -e 's#^root:[^:]*:#root::#' /etc/shadow

# Update
RUN opkg update

# findmnt
RUN opkg install mount-utils socat ath10k-firmware-qca988x pciutils usbutils

# Prevent default hooks to mess with the network and result in a loss of the
# connection to the NFS server (rootfs)
COPY 80_mount_root /lib/preinit/80_mount_root
COPY 10_indicate_preinit /lib/preinit/10_indicate_preinit

# Enable SSHD
COPY dropbear /etc/config/dropbear

# Prevent the default network config to mess with eth0
COPY network /etc/config/network
