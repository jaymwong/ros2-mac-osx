# ROS2 Mac OSX Support 
This is the natural extension of [ros1-mac-osx](https://github.com/jaymwong/ros1-mac-osx). The purpose of this repository is to hold a working copy of the libraries that has successfully built ROS on my Mac OSX machine. It's not elegant at all, in fact, it's very "hacky" and might clobber some existing `brew` packages on your machine. Regardless, I'm putting this together for my future self and the greater ROS community. That being said, I make no guarantees as to whether it will work for you. Good luck!

The following OSX versions have been tested,
- Mac OS: Catalina (10.15.7)

## Instructions
Follow the steps to get your `/usr/local/` directory working for ROS1 via [ros1-mac-osx](https://github.com/jaymwong/ros1-mac-osx), as these following instructions are based off of that. I'm guessing if I my machine did not have all these ROS1 artifacts it would make the build much easier if I had just followed the advised [ROS2 Foxy instructions](https://docs.ros.org/en/foxy/Installation/Alternatives/macOS-Development-Setup.html). But since Catalina is technically unsupported I went with systematically going through the dependencies myself. 

Anyways, the follow documents what I did, 
- Forcefully linked my Python to `3.10` using the following,
```
ln -sf /usr/local/opt/python@3.10/bin/python3.10 /usr/local/bin/python
ln -sf /usr/local/opt/python@3.10/bin/python3.10 /usr/local/bin/python3
ln -sf /usr/local/opt/python@3.10/bin/python3.10-config /usr/local/bin/python3-config
echo "export PYTHONPATH=/usr/local/lib/python3.10/site-packages/" >> ~/.bashrc
```
- Now that I had Python 3.10 I was able to `pip` the following,
```
python -m pip install vcstool
python -m pip uninstall -y enum34

python -m pip install colcon-common-extensions
python -m pip install cryptography
python -m pip install lark
python -m pip install lark-parser
python -m pip install numpy
python -m pip install netifaces
```
- Found that `cmake 3.14` was required so,
```
brew install osrf/simulation/cmake@3.21.4
echo 'export PATH="/usr/local/opt/cmake@3.21.4/bin:$PATH"' >> ~/.bashrc
```
- Then got into several fun issues with `openssl` and `tinyxml2`,
```
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
```
- Lastly systematically copied several headers and directories from the xcode frameworks into my `/usr/local/include/` directory. Honestly, if I had properly followed the xcode instructions, `colcon` probably would of found them, but this was a quick dumb workaround to ensure all the headers were found. You can see this nasty `cp -R` stuff inside `setup.sh`.
  
