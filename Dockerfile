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


WORKDIR $home

COPY build/build-bfin-toolchain.sh .

RUN chmod +x build-bfin-toolchain.sh

USER $user

ENTRYPOINT "./build-bfin-toolchain.sh"
