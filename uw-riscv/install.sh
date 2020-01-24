#!/bin/bash

###########################################################################
# References:
# https://github.com/black-parrot/pre-alpha-release
# https://github.com/black-parrot/basejump_stl
# https://github.com/google/riscv-dv
# 
#
###########################################################################

#Install pre-requisites
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

#
git clone git@github.com:black-parrot/pre-alpha-release.git
cd pre-alpha-release
make tools
make origs
make ucode
cd bp_top/syn
make build.scsim.sc PROG=hello_world



