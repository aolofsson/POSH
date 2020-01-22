#!/bin/bash

###########################################################################
# References:
#
# https://xyce.sandia.gov/documentation/BuildingGuide.html
#
###########################################################################

#Dependancies
sudo apt-get install gfortran bison flex libfl-dev libfftw3-dev libsuitesparse-dev libsuitesparse-doc libblas-dev liblapack-dev libtool libopenmpi-dev openmpi-bin libtrilinos-teuchos-dev

###########################################################################
#Install Trilinos from source
wget https://github.com/trilinos/Trilinos/archive/trilinos-release-12-12-1.tar.gz 
tar zxvf trilinos-release-12-12-1.tar.gz
mkdir -p XyceLibs/Serial
SRCDIR=$PWD/Trilinos-trilinos-release-12-12-1
ARCHDIR=$PWD/XyceLibs/Serial
FLAGS="-O3 -fPIC"
cmake \
-G "Unix Makefiles" \
-DCMAKE_C_COMPILER=gcc \
-DCMAKE_CXX_COMPILER=g++ \
-DCMAKE_Fortran_COMPILER=gfortran \
-DCMAKE_CXX_FLAGS="$FLAGS" \
-DCMAKE_C_FLAGS="$FLAGS" \
-DCMAKE_Fortran_FLAGS="$FLAGS" \
-DCMAKE_INSTALL_PREFIX=$ARCHDIR \
-DCMAKE_MAKE_PROGRAM="make" \
-DTrilinos_ENABLE_NOX=ON \
-DNOX_ENABLE_LOCA=ON \
-DTrilinos_ENABLE_EpetraExt=ON \
-DEpetraExt_BUILD_BTF=ON \
-DEpetraExt_BUILD_EXPERIMENTAL=ON \
-DEpetraExt_BUILD_GRAPH_REORDERINGS=ON \
-DTrilinos_ENABLE_TrilinosCouplings=ON \
-DTrilinos_ENABLE_Ifpack=ON \
-DTrilinos_ENABLE_Isorropia=ON \
-DTrilinos_ENABLE_AztecOO=ON \
-DTrilinos_ENABLE_Belos=ON \
-DTrilinos_ENABLE_Teuchos=ON \
-DTeuchos_ENABLE_COMPLEX=ON \
-DTrilinos_ENABLE_Amesos=ON \
-DAmesos_ENABLE_KLU=ON \
-DTrilinos_ENABLE_Sacado=ON \
-DTrilinos_ENABLE_Kokkos=OFF \
-DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF \
-DTrilinos_ENABLE_CXX11=ON \
-DTPL_ENABLE_AMD=ON \
-DAMD_LIBRARY_DIRS="/usr/lib" \
-DTPL_AMD_INCLUDE_DIRS="/usr/include/suitesparse" \
-DTPL_ENABLE_BLAS=ON \
-DTPL_ENABLE_LAPACK=ON \
$SRCDIR

make

sudo make install

##############################################################################

#Clone Xyce
git clone git@github.com:Xyce/Xyce.git

#Build Xyce
cd Xyce
./bootstrap
cd ../
./configure CXXFLAGS="-O3 -std=c++11" ARCHDIR="/home/aolofsson/work/darpa/POSH/sandia-spice/Serial" CPPFLAGS="-I/usr/include/suitesparse"
