FROM scratch

# specify which node models this image can handle
# step B.1
LABEL walt.node.models=pc-x86-64

ENTRYPOINT ["/bin/ash"]

ADD ./openwrt.tar.gz /
RUN mkdir /var/lock/

# Install packages
# step B.5 for busybox
# step B.6 for openssh

# Install custom ipxe boot scripts
# step B.2 for ipxe
COPY boot/ /boot

# Install image spec file
COPY image.spec /etc/walt/

# Copy kernel
COPY vmlinuz /

# Copy initramfs
COPY initrd.img /


# Allow passwordless root login on the serial console
RUN sed -i -e 's#^root:[^:]*:#root::#' /etc/shadow

# Update
RUN opkg update
