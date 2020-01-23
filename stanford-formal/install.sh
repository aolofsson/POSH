#!/bin/bash

###########################################################################
# References:
# https://upscale.stanford.edu/
# https://github.com/upscale-project/cosa2
# https://github.com/Boolector/boolector
# https://github.com/Boolector/btor2tools
###########################################################################




#COSA2
git clone git@github.com:upscale-project/cosa2.git
./contrib/setup-smt-switch.sh
./contrib/setup-btor2tools.sh
./configure.sh
cd build
make

#Example
git clone git@github.com:upscale-project/case-studies.git

