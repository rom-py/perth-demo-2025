#!/bin/bash

# Build and install SWAN. Used for testing using the local backend

export BUILD_DIR=/tmp/build
export INSTALL_DIR=/usr/local
export NETCDF_FORTRAN_INCLUDE_DIR=/usr/lib64/gfortran/modules
export NETCDF_FORTRAN_LIBRARY=/usr/lib64/libnetcdff.so
export NETCDF_C_INCLUDE_DIR=/usr/include
export NETCDF_C_LIBRARY=/usr/lib64/libnetcdf.so

mkdir -p $BUILD_DIR
cd $BUILD_DIR
git clone --depth 1 https://gitlab.tudelft.nl/citg/wavemodels/swan.git
cd swan
mkdir build
cd build
cmake .. -DNETCDF=ON -DMPI=OFF \
  -DNetCDF_Fortran_INCLUDE_DIR=/usr/lib64/gfortran/modules \
  -DNetCDF_Fortran_LIBRARY=/usr/lib64/libnetcdff.so \
  -DNetCDF_C_LIBRARY=/usr/lib64/libnetcdf.so \
  -DNetCDF_C_INCLUDE_DIR=/usr/include
make VERBOSE=1
echo "=== Build directory contents ==="
find . -type f -executable | head -20
echo "=== Looking for SWAN executables ==="
find . -name "*swan*" -type f
echo "=== Looking for any executables ==="
find . -type f -perm /u+x | grep -v "\.so" | head -10
echo "=== Trying to install manually ==="
find . -name "*swan*" -type f -executable -exec sudo cp {} $INSTALL_DIR/bin/ \;
echo "=== Final installed files ==="
ls -la $INSTALL_DIR/bin/
cd ../../
rm -rf $BUILD_DIR/swan
