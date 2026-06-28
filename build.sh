#!/bin/bash

set -e

if [ ! -d "/build" ]
then
  mkdir /build
fi

cd /build

# clone vcpkg
git clone --depth 1 --single-branch --no-tags https://github.com/microsoft/vcpkg.git

# bootstrap vcpkg
./vcpkg/bootstrap-vcpkg.sh
export VCPKG_ROOT="/build/vcpkg"
export PATH="${VCPKG_ROOT}:${PATH}"

# clone beammp launcher
LATEST_TAG=$(git ls-remote --tags --sort='-version:refname' https://github.com/BeamMP/BeamMP-Launcher.git | awk -F'/' 'NR==1{print $NF}')
git clone --depth 1 --branch "${LATEST_TAG}" --single-branch --no-tags https://github.com/BeamMP/BeamMP-Launcher.git

# build
cd BeamMP-Launcher
cmake . -B bin -DCMAKE_TOOLCHAIN_FILE=${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake -DVCPKG_TARGET_TRIPLET=x64-linux
cmake --build bin --parallel

# show final file
ls -l bin/BeamMP-Launcher
