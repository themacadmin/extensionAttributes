#!/bin/bash

# Xprotect Safari Extensions Blacklist Extension Attribute

echo "<result>$(/usr/bin/defaults read /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.meta.plist ExtensionBlacklist | awk -F'"' '{print $2}' | sed '/^$/d;/Developer Identifier/d')</result>"
