#!/usr/bin/env bash

# *****************************************************************************
# Brew installations from ROS install documentation
# (https://docs.ros.org/en/foxy/Installation/Alternatives/macOS-Development-Setup.html)
# *****************************************************************************

# Make the python command be Python 3.8
brew install python@3.8
brew unlink python
brew link --force python@3.8
# (The recommended 3.8 was giving me a getaddrinfo() ipv6 error so I had do,
# cd ~/Library/Caches/Homebrew/downloads/
# tar -xz 21e8b9c8f0bd935d6d5f1cf8bd73ce9b4c1e3a148c40dabaa3fe65122e564f12--Python-3.8.17.tar.xz
# ./configure --prefix=/usr/local/Cellar/python@3.8/3.8.17_1 --disable-ipv6 --enable-shared --enable-optimizations --datarootdir=/usr/local/Cellar/python@3.8/3.8.17_1

# Then I did some weird stuff to combat the issues with python since it kept
# trying to link over to Python 3.11 on my machine (maybe not required) but I
# ultimately ended up going to Python 3.10 across my entire system
# ln -sf /usr/bin/python3 /usr/local/bin/python
# mkdir -p /usr/local/opt/python@3.11/bin/
# ln -sf /usr/bin/python3  /usr/local/opt/python@3.11/bin/python3.11
# ln -sf /usr/local/opt/python@3.10/bin/python3.10 /usr/local/bin/python
# ln -sf /usr/local/opt/python@3.10/bin/python3.10 /usr/local/bin/python3
# ln -sf /usr/local/opt/python@3.10/bin/python3.10-config /usr/local/bin/python3-config
echo "export PYTHONPATH=/usr/local/lib/python3.10/site-packages/" >> ~/.bashrc

# Since we hacked up our python link all future pip command will be using python
# but in reality it is actually python3 (specifically 3.10)
python -m pip install vcstool

# Another issue: AttributeError: module 'enum' has no attribute 'IntFlag'
python -m pip uninstall -y enum34

# Now remove all indications of sourcing from ROS1 specifically these lines from
# your ~/.bashrc because it's doing some very bad python things
# source /opt/ros/kinetic/setup.bash
# source $HOME/catkin_ws/devel/setup.bash (or whatever your workspace is)

# Systematically install the pip dependencies (from the /usr/local/Celler) I
# have originally zipped up prior from the ROS1 installation; I'm doing this so
# I can understand what is minimally invasive, package by package
python -m pip install colcon-common-extensions
python -m pip install cryptography
python -m pip install lark
python -m pip install lark-parser
python -m pip install numpy

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
brew link --overwrite tinyxml2


# Adapted the instructions a bit and instead copy over to /usr/local/include all the
# fun framework headers as part of the xcode command line tools SDK
cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/* /usr/local/include/
mkdir -p /usr/local/include/CoreFoundation; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreFoundation.framework/Versions/A/Headers/* /usr/local/include/CoreFoundation
mkdir -p /usr/local/include/Foundation; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/Foundation.framework/Headers/* /usr/local/include/Foundation
mkdir -p /usr/local/include/CoreGraphics; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/* /usr/local/include/CoreGraphics
mkdir -p /usr/local/include/Security; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/Security.framework/Headers/* /usr/local/include/Security
mkdir -p /usr/local/include/CoreServices; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Headers/* /usr/local/include/CoreServices
mkdir -p /usr/local/include/AE; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/AE.framework/Headers/* /usr/local/include/AE
mkdir -p /usr/local/include/CarbonCore; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Headers/* /usr/local/include/CarbonCore
mkdir -p /usr/local/include/DiskArbitration; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/DiskArbitration.framework/Headers/* /usr/local/include/DiskArbitration
mkdir -p /usr/local/include/IOKit; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/IOKit.framework/Headers/* /usr/local/include/IOKit
mkdir -p /usr/local/include/CFNetwork; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CFNetwork.framework/Headers/* /usr/local/include/CFNetwork
mkdir -p /usr/local/include/DictionaryServices; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/DictionaryServices.framework/Headers/* /usr/local/include/DictionaryServices
mkdir -p /usr/local/include/LaunchServices; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Headers/* /usr/local/include/LaunchServices
mkdir -p /usr/local/include/OSServices; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/OSServices.framework/Headers/* /usr/local/include/OSServices
mkdir -p /usr/local/include/Metadata; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/Metadata.framework/Headers/* /usr/local/include/Metadata
mkdir -p /usr/local/include/SearchKit; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/SearchKit.framework/Headers/* /usr/local/include/SearchKit
mkdir -p /usr/local/include/FSEvents; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/FSEvents.framework/Headers/* /usr/local/include/FSEvents
mkdir -p /usr/local/include/SharedFileList; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreServices.framework/Frameworks/SharedFileList.framework/Headers/* /usr/local/include/SharedFileList
mkdir -p /usr/local/include/ApplicationServices; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/ApplicationServices.framework/Headers/* /usr/local/include/ApplicationServices
mkdir -p /usr/local/include/ATS; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/ATS.framework/Headers/* /usr/local/include/ATS
mkdir -p /usr/local/include/CoreText; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/System/Library/Frameworks/CoreText.framework/Headers/* /usr/local/include/CoreText
mkdir -p /usr/local/include/ColorSync; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/ColorSync.framework/Headers/* /usr/local/include/ColorSync
mkdir -p /usr/local/include/HiServices; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/HiServices.framework/Headers/* /usr/local/include/HiServices
mkdir -p /usr/local/include/QD; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/QD.framework/Headers/* /usr/local/include/QD
mkdir -p /usr/local/include/ImageIO; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/ImageIO.framework/Headers/* /usr/local/include/ImageIO
mkdir -p /usr/local/include/LangAnalysis; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/LangAnalysis.framework/Headers/* /usr/local/include/LangAnalysis
mkdir -p /usr/local/include/PrintCore; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/PrintCore.framework/Headers/* /usr/local/include/PrintCore
mkdir -p /usr/local/include/ATSUI; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/ATSUI.framework/Headers/* /usr/local/include/ATSUI
mkdir -p /usr/local/include/SpeechSynthesis; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/SpeechSynthesis.framework/Headers/* /usr/local/include/SpeechSynthesis
mkdir -p /usr/local/include/AppKit; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/* /usr/local/include/AppKit
mkdir -p /usr/local/include/CoreData; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreData.framework/Headers/* /usr/local/include/CoreData
mkdir -p /usr/local/include/OpenGL; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/OpenGL.framework/Headers/* /usr/local/include/OpenGL
mkdir -p /usr/local/include/CoreImage; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreImage.framework/Headers/* /usr/local/include/CoreImage
mkdir -p /usr/local/include/QuartzCore; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/QuartzCore.framework/Headers/* /usr/local/include/QuartzCore
mkdir -p /usr/local/include/CoreVideo; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreVideo.framework/Headers/* /usr/local/include/CoreVideo
mkdir -p /usr/local/include/Metal; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Metal.framework/Headers/* /usr/local/include/Metal
mkdir -p /usr/local/include/IOSurface; cp -R /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/IOSurface.framework/Headers/* /usr/local/include/IOSurface

# Edit the #include <math.h> include in /Library/Developer/CommandLineTools/usr/include/c++/v1
# to #include </Library/Developer/CommandLineTools/usr/include/c++/v1/math.h> as suggested
# via https://stackoverflow.com/questions/58628377/catalina-c-using-cmath-headers-yield-error-no-member-named-signbit-in-th
# Similarily change /Library/Developer/CommandLineTools/usr/include/c++/v1/math.h
# from #include_next <math.h> to  #include </usr/local/include/math.h>

# The tinyxml2 error reported via https://github.com/ros2/tinyxml2_vendor/pull/5
# requires that we update to master to have this take effect
cd ~/ros2_foxy/src/ros2/tinyxml2_vendor; git checkout master
