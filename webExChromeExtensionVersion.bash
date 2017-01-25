#!/bin/bash

# Find instances of WebEx Extension
webExExtensionPath=$( find / -type d -iname jlhmfgmfgeifomenelglieieghnjghma )

## If not present, value is "WebEx Extension Not Installed"
if [ -z "$webExExtensionPath" ] ; then
	echo "<result>WebEx Extension Not Installed</result>"
	exit 0
fi

# Determine if there is more than one instance of the WebEx Extension
numberOfWebExExtensions=$(echo $chromeext | awk 'END{print FNR}')
if [ $numberOfWebExExtensions -gt 1 ] ; then
		## Determine versions of each
		## Determine oldest version present
		## Value is "Multiple instances of WebEx extension present. Oldest is "$oldestWebExExtensionVersion"
		exit 0
	else
		# If only one instance of Extension, value is extension version.
		
fi


