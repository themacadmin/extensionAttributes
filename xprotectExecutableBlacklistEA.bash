#!/bin/bash

# Xprotect executable blacklist extension attribute

echo "<result>$(xmllint --format /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/XProtect.plist | awk -F'>|<' '/Description/{getline; print $3}' | sed '/^$/d')</result>"
