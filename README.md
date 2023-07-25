# ROS2 Mac OSX Support 
This is the natural extension of [ros1-mac-osx](https://github.com/jaymwong/ros1-mac-osx). The purpose of this repository is to hold a working copy of the libraries that has successfully built ROS on my Mac OSX machine. It's not elegant at all, in fact, it's very "hacky" and might clobber some existing `brew` packages on your machine. Regardless, I'm putting this together for my future self and the greater ROS community. That being said, I make no guarantees as to whether it will work for you. Good luck!

The following OSX versions have been tested,
- Mac OS: Catalina (10.15.7)

## Instructions
Follow the steps to get your `/usr/local/` directory working for ROS1 via [ros1-mac-osx](https://github.com/jaymwong/ros1-mac-osx), as these following instructions are based off of that. I'm guessing if I my machine did not have all these ROS1 artifacts it would make the build much easier if I had just followed the advised [ROS2 Foxy instructions](https://docs.ros.org/en/foxy/Installation/Alternatives/macOS-Development-Setup.html). But since Catalina is technically unsupported I went with systematically going through the dependencies myself. 

Anyways, the follow documents what I did, 
- Forcefully linked my Python to `3.10` and manually did `pip` installs
- Fixed the minimal `cmake 3.14` requirement by going to `cmake 3.21.4`
- Fixed several issues with `openssl` and `tinyxml2`,
- Copied over several xcode framework headers into `/usr/local/include/` (probably not needed if I did xcode stuff properly)
I conveniently added these into their own separate scripts if you choose to run, 
```
bash pip-install.sh
bash brew-install.sh
bash cp-mac-osx-sdk.sh
```
  
## Setting up `~/.bashrc`
At the end of the day, my `~/.bashrc` looked something like,
```
export LDFLAGS="-L/usr/local/opt/boost@1.76/lib"
export CPPFLAGS="-I/usr/local/opt/boost@1.76/include"
export PATH="/usr/local/opt/cmake@3.21.4/bin:$PATH"
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@3

export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/usr/local/opt/qt@5
export PATH=$PATH:/usr/local/opt/qt@5/bin
```
