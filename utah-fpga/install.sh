#!/bin/bash

###########################################################################
# References:
#
# https://github.com/LNIS-Projects/OpenFPGA
#
###########################################################################

#Clone repo and build
git clone https://github.com/LNIS-Projects/OpenFPGA.git
cd OpenFPGA
mkdir build
cd build
cmake ..  -DCMAKE_BUILD_TYPE=debug
make                              

