#!/bin/bash

###########################################################################
# References:
#
# https://github.com/PrincetonUniversity/openpiton
# http://parallel.princeton.edu/openpiton/
#
###########################################################################

###########################################################################
#Install Dependancies
###########################################################################
sudo apt install gperf 
sudo apt install autoconf
sudo apt install automake
sudo apt install autotools-dev
sudo apt install libmpc-dev
sudo apt install libmpfr-dev
sudo apt install libgmp-dev
sudo apt install gawk
sudo apt install build-essential
sudo apt install bison
sudo apt install flex
sudo apt install texinfo
sudo apt install python-pexpect
sudo apt install libusb-1.0-0-dev
sudo apt install default-jdk
sudo apt install zlib1g-dev
sudo apt install valgrind
sudo apt install csh

###########################################################################
#Download OpenPiton
###########################################################################

git clone git@github.com:PrincetonUniversity/openpiton.git

###########################################################################
#Setup Environment
###########################################################################

PITONROOT=$PWD/openpiton/
cd $PITON_ROOT
source ./piton/ariane_setup.sh
source ./piton/ariane_build_tools.sh

