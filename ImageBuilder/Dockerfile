FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y sudo time git-core subversion build-essential g++ bash make libssl-dev patch libncurses5 libncurses5-dev zlib1g-dev gawk flex gettext wget unzip xz-utils python python-distutils-extra python3 python3-distutils-extra genisoimage ccache && \
    apt-get clean

RUN useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

RUN ln -s /usr/bin/genisoimage /usr/bin/mkisofs
RUN mkdir /ccache

USER user
WORKDIR /home/user

RUN git config --global user.name "user" && git config --global user.email "user@example.com"

RUN git clone https://git.openwrt.org/openwrt/openwrt.git
RUN cd openwrt && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a

COPY --chown=user config /home/user/openwrt/.config

RUN cd /home/user/openwrt && \
    make defconfig

RUN cd /home/user/openwrt && \
    make -j8
