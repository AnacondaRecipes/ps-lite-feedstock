#!/bin/bash
echo "Building ${PKG_NAME}."


# Isolate the build.
mkdir -p Build-${PKG_NAME}
cd Build-${PKG_NAME} || exit 1


# Generate the build files.
echo "Generating the build files..."
cmake .. ${CMAKE_ARGS} \
      -GNinja \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_BUILD_TYPE=Release \
      \
      -DDMLC_USE_CXX11=ON \


# Build.
echo "Building..."
ninja -j${CPU_COUNT} || exit 1


# Perform tests.
#  echo "Testing..."
#  ninja test || exit 1
#  path_to/test || exit 1
#  ctest -VV --output-on-failure || exit 1


# Installing
echo "Installing..."
#ninja install || exit 1
cp -r ${SRC_DIR}/include/ps ${PREFIX}/include || exit 1
cp libpslite.a ${PREFIX}/lib || exit 1


# Error free exit!
echo "Error free exit!"
exit 0
