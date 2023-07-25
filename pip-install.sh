#!/usr/bin/env bash

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
python -m pip install netifaces
python -m pip install ifcfg
python -m pip install pyside2
python -m pip install sip
python -m pip install PyQt5
