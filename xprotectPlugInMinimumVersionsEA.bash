#!/bin/bash

# Xprotect PlugIn Minimum Versions Extension Attribute

echo "<result>$(/usr/bin/defaults read /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist PlugInBlacklist | awk -F'"' '{print $2}' | sed '/^$/d;N;s/\n/ /')</result>"
