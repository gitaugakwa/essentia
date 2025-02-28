#!/usr/bin/env bash
set -e
. ../build_config.sh

rm -rf tmp
mkdir tmp
cd tmp

echo "Installing headers for Eigen $EIGEN_VERSION"

curl -SLO https://gitlab.com/libeigen/eigen/-/archive/$EIGEN_VERSION/eigen-$EIGEN_VERSION.tar.gz
tar -xf eigen-$EIGEN_VERSION.tar.gz
cd eigen-$EIGEN_VERSION

mkdir build
cd build

cmake ../ -DCMAKE_INSTALL_PREFIX=$PREFIX -DEIGEN_BUILD_PKGCONFIG=ON
# make install
msbuild INSTALL.vcxproj
mkdir -p "$PREFIX"/lib/pkgconfig/
cp eigen3.pc "$PREFIX"/lib/pkgconfig/

cd ../../..
rm -rf tmp
