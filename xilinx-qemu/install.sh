#!/bin/bash

###########################################################################
# References:
#
# https://github.com/Xilinx/libsystemctlm-soc
# https://github.com/Xilinx/libsystemctlm-soc
# https://github.com/Xilinx/qemu-devicetrees.git
# https://github.com/Xilinx/qemu
# https://www.accellera.org/

###########################################################################


#Install dependancies (for qemu and libsystemc)
sudo apt-get install build-essential git autoconf automake libtool flex bison perl python3 g++ gawk
sudo apt-get install verilator gtkwave rapidjson-dev python-pytest python-pytest-xdist
sudo apt install libglib2.0-dev libgcrypt20-dev zlib1g-dev libpixman-1-dev

#SystemC Installation
wget https://www.accellera.org/images/downloads/standards/systemc/systemc-2.3.2.tar.gz
tar zxvf systemc-2.3.2.tar.gz
pushd systemc-2.3.2
mkdir objdir
cd objdir
export CXX="g++"
../configure --prefix=/usr/local/systemc-2.3.2
make -j 4
make check
sudo mkdir -p /usr/local/systemc-2.3.2
sudo make install
popd

#Clone libsystemctlm-soc
git clone https://github.com/Xilinx/libsystemctlm-soc

#Run Tests
cd libsystemctlm-soc/tests
touch ../.config.mk
make examples-run
cd ../../


#Setup QEMU (incomplete)
git clone git://github.com/Xilinx/qemu.git
cd qemu
git submodule update --init dtc
./configure --target-list="aarch64-softmmu,microblazeel-softmmu" --enable-fdt --disable-kvm --disable-xen
make -j 4

#Get LINUX kernel (incomplete)


#Setup QEMU device tree (incomplete)
git clone https://github.com/Xilinx/qemu-devicetrees.git
cd qemu-devicetrees
make


#Clone demo
git clone git@github.com:Xilinx/systemctlm-cosim-demo.git
cd systemctlm-cosim-demo
git submodule update --init libsystemctlm-soc

#Run demo (incomplete)
