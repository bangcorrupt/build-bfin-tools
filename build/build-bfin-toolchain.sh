#!/bin/bash

cd ${HOME}

echo "Fetching openocd..."

#wget -O openocd-cces-2.10.0-src.tar.gz \
#	--ftp-user=anonymous --ftp-password=ftp.analog.com \
#	ftp://ftp.analog.com/pub/tools/patches/gnu_sources/cces/2.10.0/openocd-cces-2.10.0-src.tar.gz

#echo "Extracting openocd..."

#tar -xvf openocd-cces-2.10.0-src.tar.gz

#cd openocd-cces-2.10.0-src/buildscript

git clone https://github.com/bangcorrupt/openocd-blackfin.git

cd openocd-blackfin/buildscript

echo "Building openocd..."

./BuildToolChain -j$(nproc) openocd


cd ${HOME}


echo "Fetching GNU toolchain..."

git clone https://github.com/bangcorrupt/blackfin-plus-gnu.git

cd blackfin-plus-gnu/gcc

./contrib/download_prerequisites

cd ../buildscript/

echo "Building GNU toolchain..."

./build.sh


