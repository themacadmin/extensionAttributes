#!/bin/bash

if [ ! -d "/Applications/VirtualBox.app" ] && [ ! -d "/Applications/Parallels Desktop.app" ] && [ ! -d "/Applications/VMware Fusion.app" ]  ; then
  echo "<result>"No"</result>"
  exit 0
fi

OLDIFS=$IFS
IFS=$'\n'

for vmInfoFile in $( find / \( -name "*.vmx" -o -name "*.pvi" -o -name "*.vbox" \) ); do
	if [[ $vmInfoFile == *".pvi"* ]]; then
		# Check Parallels .pvi file for indows
  		vmGuestOS=$( xpath "$vmInfoFile" /VmInfo/GuestOsInformation/RealOsType | awk '{gsub(/<[^>]*>/,"")};1' | awk -F '[,]' '{print $1}' )
  		if [[ $vmGuestOS == *"indows"* ]]; then
  		echo "<result>"Yes"</result>"
  		exit 0
  		fi
  	elif [[ $vmInfoFile == *".vmx"* ]]; then
  		# Check VMware .vmx file for indows
  		vmGuestOS=$( awk -F '["]' '/guestOS/{print $2}' "$vmInfoFile" )
  		if [[ $vmGuestOS == *"indows"* ]]; then
  		echo "<result>"Yes"</result>"
  		exit 0
  		fi
  	elif [[ $vmInfoFile == *".vbox"* ]]; then
  		# Check VirtualBox .vbox file for indows
  		vmGuestOS=$( awk -F '["]' '/OSType/{print $6}' "$vmInfoFile" )
  		if [[ $vmGuestOS == *"indows"* ]]; then
  		echo "<result>"Yes"</result>"
  		exit 0
  		fi
	fi
done
IFS=$OLDIFS

echo "<result>"No"</result>"

exit 0
