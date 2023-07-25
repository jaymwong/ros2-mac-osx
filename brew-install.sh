#!/usr/bin/env bash

# While doing this I see an error here:
# --- stderr: foonathan_memory_vendor
# CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
#   CMake 3.14 or higher is required.  You are running version 3.11.4
brew install osrf/simulation/cmake@3.21.4
echo 'export PATH="/usr/local/opt/cmake@3.21.4/bin:$PATH"' >> ~/.bashrc

brew install openssl
brew install cunit
echo "export OPENSSL_ROOT_DIR=$(brew --prefix openssl)" >> ~/.bashrc
echo "export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/usr/local/opt/qt@5"  >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/opt/qt@5/bin"  >> ~/.bashrc
source ~/.bashrc
brew unlink openssl && brew link openssl@3

brew install tinyxml2
brew unlink tinyxml2
brew link --overwrite tinyxml2
