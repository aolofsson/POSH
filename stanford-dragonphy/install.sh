#!/bin/bash

###########################################################################
# References:
# https://upscale.stanford.edu/
# https://github.com/StanfordVLSI/dragonphy
#
###########################################################################

#Setting up anaconda
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
sha256sum Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
source ~/.bashrc
echo "conda activate" >> ~/.bashrc
conda install -c anaconda magma
conda list
pip search anasymod

#Clone repos for reference
git clone git@github.com:sgherbst/svreal.git
git clone git@github.com:sgherbst/msdsl.git
git clone git@github.com:sgherbst/anasymod.git

#Clone Dragonphy
git clone https://github.com/StanfordVLSI/dragonphy.git
cd dragonphy
pip install -e .


