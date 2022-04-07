FROM debian:jessie

ARG user=builder
ARG pass=blackfin
ARG home=/home/$user


RUN apt update && apt upgrade -y && \
	apt install -y wget texinfo g++ \ 
	autoconf automake gcc make gettext \
	pkg-config libtool realpath bash git \
 	bison flex m4 bzip2 vim sudo


RUN useradd --create-home -s /bin/bash $user \
        && echo $user:$pass | chpasswd \
        && adduser $user sudo




#RUN useradd -m -d /home/builder/ -s /bin/bash -U -G sudo  builder

WORKDIR $home

COPY build-bfin-toolchain.sh .

RUN chmod +x build-bfin-toolchain.sh

USER $user
#UN wget -O openocd-cces-2.10.0-src.tar.gz \
#--ftp-user=anonymous --ftp-password=ftp.analog.com \
#ftp://ftp.analog.com/pub/tools/patches/gnu_sources/cces/2.10.0/openocd-cces-2.10.0-src.tar.gz

#UN tar -xvf openocd-cces-2.10.0-src.tar.gz

#ORKDIR /home/builder/openocd-cces-2.10.0-src/buildscript

#UN ./BuildToolChain -j$(nproc) openocd


ENTRYPOINT "./build-bfin-toolchain.sh"
