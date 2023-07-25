#!/usr/bin/env bash

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
