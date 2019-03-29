#!/bin/sh

export PATH=$NDK_TOOLCHAIN/bin:$PATH
target_host=arm-linux-androideabi
export AR=$target_host-ar
export AS=$target_host-clang
export CC=$target_host-clang
export CXX=$target_host-clang++
export LD=$target_host-ld
export STRIP=$target_host-strip
# Tell configure what flags Android requires.
export CFLAGS="-fPIE -fPIC"
echo $STRIP
export CXXFLAGS="-std=c++03"
export LDFLAGS="-pie"
prefix_dir=`pwd`/android-arm

./configure --disable-debug \
--disable-util \
--disable-option-checking \
--disable-debug \
--enable-optimize \
--disable-fvisibility \
--disable-gch \
--disable-largefile  \
--disable-dependency-tracking \
--disable-libtool-lock \
--disable-cygwin-win32 \
--disable-mingw-threads \
--host=arm-hisiv100nptl-linux \
--prefix=$prefix_dir \
&& make clean && make && make install
