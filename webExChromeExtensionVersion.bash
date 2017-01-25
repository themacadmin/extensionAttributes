#!/bin/bash

# Find instances of WebEx Extension
webExExtensionPath=$( find / -type d -iname jlhmfgmfgeifomenelglieieghnjghma )

## If not present, value is "WebEx Extension Not Installed"
if [ -z "$webExExtensionPath" ] ; then
	echo "<result>Not Installed</result>"
	exit 0
fi

# Determine if there is more than one instance of the WebEx Extension
numberOfWebExExtensions=$(echo $webExExtensionPath | awk 'END{print FNR}')
if [ $numberOfWebExExtensions -gt 1 ] ; then
		echo "<result>Multiple Versions Present</result>"
		## FUTURE STATE BELOW
		## Determine versions of each
		## Determine oldest version present
		## Value is "Multiple instances of WebEx extension present. The oldest version is "$oldestWebExExtensionVersion"
		exit 0
	else
		# If only one instance of Extension, value is extension version.
		singleWebExVersion=$(ls -t "$webExExtensionPath" | head -n1)
		echo "<result>$singleWebExVersion</result>"
		
fi

exit 0
