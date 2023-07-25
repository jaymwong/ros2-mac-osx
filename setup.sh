#!/usr/bin/env bash

bash pip-install.sh
bash brew-install.sh
# bash cp-mac-osx-sdk.sh

# Edit the #include <math.h> include in /Library/Developer/CommandLineTools/usr/include/c++/v1
# to #include </Library/Developer/CommandLineTools/usr/include/c++/v1/math.h> as suggested
# via https://stackoverflow.com/questions/58628377/catalina-c-using-cmath-headers-yield-error-no-member-named-signbit-in-th
# Similarily change /Library/Developer/CommandLineTools/usr/include/c++/v1/math.h
# from #include_next <math.h> to  #include </usr/local/include/math.h>
# Apply this change: https://stackoverflow.com/questions/58064487/xcode-11-cocos2dx-compilation-problem-argument-value-10880-is-outside-the-vali
