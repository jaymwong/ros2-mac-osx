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

# These installs was needed to apply the pyside@2 patch here for rqt_gui 
# https://github.com/ros-visualization/python_qt_binding/issues/103#issuecomment-1231062249
brew install readline 
brew link readline 

ln -s /usr/local/Cellar/readline/8.2.1 /usr/local/opt/readline
ln -s /usr/local/Cellar/sqlite/3.42.0 /usr/local/opt/sqlite
ln -s /usr/local/Cellar/xz/5.4.3 /usr/local/opt/xz
ln -s /usr/local/opt/cmake\@3.21.4  /usr/local/opt/cmake
ln -s /usr/local/Cellar/lz4/1.9.4 /usr/local/opt/lz4
brew install pyside@2
